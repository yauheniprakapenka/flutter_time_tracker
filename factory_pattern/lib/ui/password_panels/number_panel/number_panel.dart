import 'package:flutter/material.dart';

import 'builders/buttons_row_builder.dart';
import 'builders/password_buttons_builder.dart';
import 'composites/custom_row_with_buttons.dart';

class NumberPanel extends StatelessWidget {
  const NumberPanel({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonsRowBuilder(buttons: buildPasswordButtons(from: 1, to: 3)),
        ButtonsRowBuilder(buttons: buildPasswordButtons(from: 4, to: 6)),
        ButtonsRowBuilder(buttons: buildPasswordButtons(from: 7, to: 9)),
        const CustomRowWithButtons(),
      ],
    );
  }
}
