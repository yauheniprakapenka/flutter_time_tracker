import 'package:access_key/ui/components/number_access_buttons/builders/buttons_row_builder.dart';
import 'package:access_key/ui/components/number_access_buttons/decorators/button_decorator.dart';
import 'package:access_key/ui/components/number_access_buttons/widgets/access_key_button.dart';
import 'package:access_key/ui/components/number_access_buttons/widgets/delete_button.dart';
import 'package:access_key/ui/components/number_access_buttons/widgets/empty_space_button.dart';
import 'package:flutter/material.dart';

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
  EmptySpaceButton(),
  NumberButton(
    text: '0',
    onPressed: () {
      print('0 tapped');
    },
  ),
  DeleteButton(),
];
