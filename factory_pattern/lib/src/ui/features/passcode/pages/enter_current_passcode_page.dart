import 'package:flutter/material.dart';

import '../../../../../passcode.dart';
import '../../../../app/localization/i_localization.dart';
import 'builders/passcode_page_builder.dart';

class EnterCurrentPasscodePage extends StatelessWidget {
  const EnterCurrentPasscodePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final localization = UIServiceLocator.instance.get<ILocalization>();
    return PasscodePageBuilder(
      taskText: localization.enterCurrentPasscode,
      passcodeAdapterWithAnimation: true,
    );
  }
}
