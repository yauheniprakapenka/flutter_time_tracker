import 'package:flutter/material.dart';

import '../../../di/di.dart';
import '../../../shared/localization/i_localization.dart';
import 'builders/passcode_page_builder.dart';

class RepeatPasscodePage extends StatelessWidget {
  const RepeatPasscodePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final localization = ColorServiceLocator.instance.get<ILocalization>();
    return PasscodePageBuilder(
      taskText: localization.repeatPasscode,
      passcodeAdapterWithAnimation: true,
    );
  }
}
