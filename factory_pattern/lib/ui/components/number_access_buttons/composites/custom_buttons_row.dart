import 'package:flutter/material.dart';

import '../builders/buttons_row_builder.dart';
import '../decorators/button_decorator.dart';
import '../widgets/access_key_button.dart';
import '../widgets/delete_button.dart';
import '../widgets/empty_space_button.dart';

class CustomButtonsRow extends StatelessWidget {
  const CustomButtonsRow({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final decoratedButtons = <Widget>[
      ..._buttons.map((button) {
        return ButtonDecorator(button: button);
      }),
    ];
    return ButtonsRowBuilder(buttons: decoratedButtons);
  }
}

final _buttons = <Widget>[
  const EmptySpaceButton(),
  NumberButton(
    text: '0',
    onPressed: () {
      print('0 tapped');
    },
  ),
  const DeleteButton(),
];
