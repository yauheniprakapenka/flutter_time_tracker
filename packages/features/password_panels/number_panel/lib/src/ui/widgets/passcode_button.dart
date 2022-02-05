import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../config/number_panel_config.dart';
import '../../interface/i_number_panel_color.dart';

class PasscodeButton extends StatelessWidget {
  final int titleNumber;
  final Function(int pressedNumber) onPressed;

  const PasscodeButton({
    Key? key,
    required this.titleNumber,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(context) {
    final config = GetIt.I.get<NumberPanelConfig>();
    final colors = GetIt.I.get<INumberPanelColor>();

    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith((states) {
          return Size(config.buttonSize, config.buttonSize);
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              config.buttonSize * 0.5,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return colors.primary;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return colors.onPrimary;
        }),
      ),
      onPressed: () {
        onPressed(titleNumber);
      },
      child: Center(
        child: Text(
          '$titleNumber',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
