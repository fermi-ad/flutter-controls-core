import 'package:flutter/material.dart';

/// A row displaying a label and a value, with optional editing capabilities.
///
/// Layout: Label (flex 2) on the left, value + units (flex 1) on the right.
/// Only the value portion is editable; units remain static.
///
/// When [onValueChanged] is provided (non-null), the widget becomes editable:
/// - The value portion has a highlighted background to indicate it's settable
/// - Clicking the value enters edit mode with a text field
/// - Clicking outside exits edit mode without saving
/// - Pressing ENTER saves the value via [onValueChanged] callback
///
/// This widget comes in two flavors:
/// 1. Static: Pass [value] directly for non-changing data
/// 2. Reactive: Pass [valueBuilder] for data that changes - only the value portion rebuilds
class PanelRow extends StatefulWidget {
  const PanelRow({
    super.key,
    required this.label,
    this.value,
    this.valueBuilder,
    this.onValueChanged,
    this.valueColor,
    this.units,
  }) : assert(
         (value != null) ^ (valueBuilder != null),
         'Either value or valueBuilder must be provided, but not both',
       );

  final String label;
  final String? value;
  final String Function(BuildContext)? valueBuilder;
  final void Function(String)? onValueChanged;
  final Color? valueColor;
  final String? units;

  @override
  State<PanelRow> createState() => _PanelRowState();
}

class _PanelRowState extends State<PanelRow> {
  bool _isEditing = false;
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    // When focus is lost (clicking outside), exit edit mode without saving
    if (!_focusNode.hasFocus && _isEditing) {
      setState(() => _isEditing = false);
    }
  }

  String _getCurrentValue(final BuildContext context) =>
      widget.value ?? widget.valueBuilder!(context);

  void _enterEditMode() {
    setState(() {
      _isEditing = true;
      _controller.text = _getCurrentValue(context);
      _controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _controller.text.length,
      );
    });

    // Request focus after the widget rebuilds

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  void _submitValue() {
    final newValue = _controller.text;

    setState(() => _isEditing = false);
    widget.onValueChanged!(newValue);
  }

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final style = textTheme.titleMedium?.copyWith(
      fontWeight: .w500,
      color: widget.valueColor,
    );

    final isEditable = widget.onValueChanged != null;

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            widget.label,
            style: textTheme.titleMedium,
            overflow: .clip,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: .end,
            children: [
              if (isEditable)
                Flexible(
                  child: _isEditing
                      ? TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          style: style,
                          textAlign: .right,
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: .symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          onSubmitted: (_) => _submitValue(),
                        )
                      : GestureDetector(
                          onTap: _enterEditMode,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHighest,
                              borderRadius: .circular(4.0),
                            ),
                            child: widget.valueBuilder != null
                                ? _ValueBuilder(
                                    builder: widget.valueBuilder!,
                                    style: style,
                                  )
                                : Text(
                                    widget.value!,
                                    style: style,
                                    overflow: .clip,
                                    textAlign: .right,
                                  ),
                          ),
                        ),
                )
              else if (widget.valueBuilder != null)
                _ValueBuilder(builder: widget.valueBuilder!, style: style)
              else
                Text(
                  widget.value!,
                  style: style,
                  overflow: .clip,
                  textAlign: .right,
                ),
              if (widget.units != null) ...[
                const SizedBox(width: 4),
                Text(widget.units!, style: style, overflow: .clip),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Internal widget that rebuilds only when its specific dependency changes.
class _ValueBuilder extends StatelessWidget {
  const _ValueBuilder({required this.builder, required this.style});

  final String Function(BuildContext) builder;
  final TextStyle? style;

  @override
  Widget build(final BuildContext context) =>
      Text(builder(context), style: style, overflow: .clip, textAlign: .right);
}
