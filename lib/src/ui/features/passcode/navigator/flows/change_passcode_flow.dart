import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../pages/create_passcode_page.dart';
import '../../pages/enter_current_passcode_page.dart';
import '../../pages/repeat_passcode_page.dart';

List<MaterialPage> getChangePasscodeFlow(PasscodeUseCase useCase) {
  return [
    if (useCase == PasscodeUseCase.enterCurrentPasscode) const MaterialPage(child: EnterCurrentPasscodePage()),
    if (useCase == PasscodeUseCase.createPasscode) const MaterialPage(child: CreatePasscodePage()),
    if (useCase == PasscodeUseCase.repeatPasscode) const MaterialPage(child: RepeatPasscodePage()),
  ];
}
