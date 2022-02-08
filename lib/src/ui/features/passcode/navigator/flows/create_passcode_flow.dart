import 'package:flutter/material.dart';

import '../../../../../domain/entities/entities.dart';
import '../../pages/create_passcode_page.dart';
import '../../pages/repeat_passcode_page.dart';

List<MaterialPage> getCreatePasscodeFlow(PasscodeUseCase useCase) {
  return [
    if (useCase == PasscodeUseCase.repeatPasscode) const MaterialPage(child: RepeatPasscodePage()),
    if (useCase == PasscodeUseCase.createPasscode) const MaterialPage(child: CreatePasscodePage()),
  ];
}
