import 'package:flutter/material.dart';
import 'package:passcode/ui/password_panels/number_panel/decorators/button_padding_decorator.dart';

import '../widgets/password_button.dart';

List<Widget> buildPasswordButtons({required int from, required int to}) {
  final buttons = <Widget>[];
  for (var i = from; i < to + 1; i++) {
    buttons.add(
      ButtonPaddingDecorator(
        child: PasswordButton(
          titleNumber: i,
          onPressed: (pressedNumber) {
            print(i);
          },
        ),
      ),
    );
  }
  return buttons;
}
