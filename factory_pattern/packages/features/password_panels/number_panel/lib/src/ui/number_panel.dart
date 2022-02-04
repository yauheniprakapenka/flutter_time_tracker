import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../config/number_panel_config.dart';
import '../interface/i_number_panel_color.dart';
import 'builders/passcode_buttons_builder.dart';
import 'composites/custom_buttons.dart';

class NumberPanel extends StatelessWidget {
  NumberPanel({
    Key? key,
    required int passcodeLength,
    required Widget deleteIcon,
    required INumberPanelColor colors,
  }) : super(key: key) {
    if (!GetIt.I.isRegistered<NumberPanelConfig>()) {
      GetIt.I.registerLazySingleton<NumberPanelConfig>(
        () => NumberPanelConfig(
          passcodeLength: passcodeLength,
          deleteIcon: deleteIcon,
        ),
      );
    }
    if (!GetIt.I.isRegistered<INumberPanelColor>()) {
      GetIt.I.registerLazySingleton<INumberPanelColor>(() => colors);
    }
  }

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
