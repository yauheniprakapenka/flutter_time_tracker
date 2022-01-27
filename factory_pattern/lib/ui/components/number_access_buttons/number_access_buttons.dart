import 'package:flutter/material.dart';

import 'builders/number_buttons_builder.dart';
import 'composites/custom_buttons.dart';

class NumberAccessButtons extends StatelessWidget {
  const NumberAccessButtons({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        NumberButtonsBuilder(from: 1, to: 3),
        NumberButtonsBuilder(from: 4, to: 6),
        NumberButtonsBuilder(from: 7, to: 9),
        CustomButtons(),
      ],
    );
  }
}
