import 'package:flutter/material.dart';

import '../builders/buttons_row_builder.dart';
import '../decorators/button_padding_decorator.dart';
import '../widgets/button_placeholder.dart';
import '../widgets/delete_button.dart';
import '../widgets/password_button.dart';

class CustomRowWithButtons extends StatelessWidget {
  const CustomRowWithButtons({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return ButtonsRowBuilder(
      buttons: _decorateButtons(),
    );
  }

  List<Widget> _buildButtons() {
    return [
      const ButtonPlaceholder(),
      PasswordButton(
          titleNumber: 0,
          onPressed: (pressedNumber) {
            print(pressedNumber);
          }),
      DeleteButton(
        onPressed: () {
          print('delete');
        },
      ),
    ];
  }

  List<Widget> _decorateButtons() {
    return _buildButtons().map((button) {
      return ButtonPaddingDecorator(
        child: button,
      );
    }).toList();
  }
}
