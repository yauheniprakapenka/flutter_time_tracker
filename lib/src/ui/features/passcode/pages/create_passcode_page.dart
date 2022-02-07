import 'package:flutter/material.dart';

import '../../../../app/di/app_color_service_locator.dart';
import '../../../shared/localization/i_localization.dart';
import 'builders/passcode_page_builder.dart';

class CreatePasscodePage extends StatelessWidget {
  const CreatePasscodePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final localization = AppColorServiceLocator.instance.get<ILocalization>();
    return PasscodePageBuilder(
      taskText: localization.createPasscode,
      passcodeAdapterWithAnimation: false,
    );
  }
}
