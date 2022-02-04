import 'package:flutter/material.dart';

class NumberPanelConfig {
  final int passcodeLength;
  final Widget deleteIcon;

  /// Width and height passcode button.
  ///
  /// Example buttons: 0, 1...9, delete, placeholder.
  double get buttonSize => 75.0;

  const NumberPanelConfig({
    required this.passcodeLength,
    required this.deleteIcon,
  });
}
