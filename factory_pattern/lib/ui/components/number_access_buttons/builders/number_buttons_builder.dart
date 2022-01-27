import 'package:flutter/material.dart';

import '../decorators/button_decorator.dart';
import '../widgets/access_key_button.dart';

/// Example:
///
/// ```
/// _buildButtons(from: 1, to: 3)
/// ```
List<Widget> buildNumberButtons({required int from, required int to}) {
  final buttons = <Widget>[];
  for (var i = from; i < to + 1; i++) {
    buttons.add(ButtonDecorator(
      button: NumberButton(
        text: '$i',
        onPressed: () {
          print('$i tapped');
        },
      ),
    ));
  }
  return buttons;
}
