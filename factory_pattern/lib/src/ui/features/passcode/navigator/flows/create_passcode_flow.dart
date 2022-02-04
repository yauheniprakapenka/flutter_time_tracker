import 'package:flutter/material.dart';

import '../../models/passcode_use_case.dart';
import '../../pages/create_passcode_page.dart';
import '../../pages/repeat_passcode_page.dart';

List<MaterialPage> buildCreatePasscodeFlow(PasscodeUseCase useCase) {
  return [
    if (useCase == PasscodeUseCase.repeatPasscode) const MaterialPage(child: RepeatPasscodePage()),
    if (useCase == PasscodeUseCase.createPasscode) const MaterialPage(child: CreatePasscodePage()),
  ];
}
