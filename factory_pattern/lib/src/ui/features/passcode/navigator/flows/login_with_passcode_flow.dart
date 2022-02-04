import 'package:flutter/material.dart';

import '../../pages/enter_current_passcode_page.dart';

List<MaterialPage> buildLoginWithPasscodeFlow() {
  return [
    const MaterialPage(child: EnterCurrentPasscodePage()),
  ];
}
