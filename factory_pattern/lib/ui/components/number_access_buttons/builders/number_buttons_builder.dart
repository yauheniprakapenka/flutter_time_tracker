import 'package:access_key/ui/components/number_access_buttons/decorators/button_decorator.dart';
import 'package:access_key/ui/components/number_access_buttons/widgets/access_key_button.dart';
import 'package:flutter/material.dart';

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
