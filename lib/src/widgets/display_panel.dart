import 'package:flutter/material.dart';

/// A styled panel widget that displays a title and a list of content widgets.
///
/// [DisplayPanel] creates a card-based container with a blue-grey border and
/// rounded corners. The panel features a cyan-accented title at the top,
/// followed by vertically-stacked content widgets with consistent padding.
///
/// This widget is commonly used to group related information or controls
/// in a visually distinct section of the UI.
///
/// Example:
/// ```dart
/// DisplayPanel(
///   title: 'Device Status',
///   contents: [
///     Text('Temperature: 25°C'),
///     Text('Pressure: 101.3 kPa'),
///     ElevatedButton(
///       onPressed: () {},
///       child: Text('Refresh'),
///     ),
///   ],
/// )
/// ```
///
/// Although the [contents] can be any list of widgets, it was originally
/// designed to be used with [PanelRow] widgets.
class DisplayPanel extends StatelessWidget {
  /// The title text displayed at the top of the panel.
  final String title;

  /// The list of widgets to display as the panel's content.
  ///
  /// Each widget is wrapped with symmetric padding and stacked vertically
  /// below the title.
  final List<Widget> contents;

  /// Creates a [DisplayPanel] with the specified [title] and [contents].
  const DisplayPanel({required this.title, required this.contents, super.key});

  @override
  Widget build(final BuildContext context) => Card(
    margin: const .only(bottom: 16.0),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.blueGrey, width: 1, style: .solid),
      borderRadius: .circular(6.0),
    ),
    child: Padding(
      padding: const .all(8.0),
      child: SizedBox(
        width: .infinity,
        child: Column(
          mainAxisSize: .min,
          children: [
            Padding(
              padding: const .only(bottom: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 16,
                  fontWeight: .bold,
                ),
              ),
            ),
            ...contents.map(
              (final widget) => Padding(
                padding: const .symmetric(vertical: 2.0, horizontal: 8.0),
                child: widget,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
