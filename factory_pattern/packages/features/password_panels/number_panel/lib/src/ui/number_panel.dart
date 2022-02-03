import 'package:flutter/material.dart';

import 'builders/passcode_buttons_builder.dart';
import 'composites/custom_buttons.dart';

class NumberPanel extends StatelessWidget {
  const NumberPanel({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        PasscodeButtonsBuilder(from: 1, to: 3),
        PasscodeButtonsBuilder(from: 4, to: 6),
        PasscodeButtonsBuilder(from: 7, to: 9),
        CustomButtons(),
      ],
    );
  }
}
