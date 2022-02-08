import 'package:flutter/material.dart';

import '../domain/domain.dart';
import '../ui/ui.dart';

class PasscodeNavigatorConfigurator {
  final PasscodeFlow passcodeFlow;
  final int passcodeLength;
  final ILocalization localization;
  final IColor color;
  final Widget? logo;
  final Widget deleteIcon;

  const PasscodeNavigatorConfigurator({
    required this.passcodeFlow,
    required this.passcodeLength,
    required this.localization,
    required this.color,
    required this.deleteIcon,
    this.logo,
  });

  PasscodeNavigatorConfigurator copyWith({
    PasscodeFlow? passcodeFlow,
    int? passcodeLength,
    ILocalization? localization,
    IColor? color,
    Widget? logo,
    Widget? deleteIcon,
  }) {
    return PasscodeNavigatorConfigurator(
      passcodeFlow: passcodeFlow ?? this.passcodeFlow,
      passcodeLength: passcodeLength ?? this.passcodeLength,
      localization: localization ?? this.localization,
      color: color ?? this.color,
      logo: logo ?? this.logo,
      deleteIcon: deleteIcon ?? this.deleteIcon,
    );
  }
}
