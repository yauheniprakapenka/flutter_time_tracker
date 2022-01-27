import 'package:flutter/material.dart';

import '../../widgets/buttons/buttons.dart';
import 'builders/buttons_row_builder.dart';
import 'composites/custom_row_with_buttons.dart';

class NumberAccessButtons extends StatelessWidget {
  const NumberAccessButtons({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonsRowBuilder(buttons: [oneButton, twoButton, threeButton]),
        ButtonsRowBuilder(buttons: [fourButton, fiveButton, sixButton]),
        ButtonsRowBuilder(buttons: [sevenButton, eightButton, nineButton]),
        const CustomRowWithButtons(),
      ],
    );
  }
}
