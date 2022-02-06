import 'package:flutter/material.dart';

import '../../pages/enter_current_passcode_page.dart';

List<MaterialPage> getLoginWithPasscodeFlow() {
  return [
    const MaterialPage(child: EnterCurrentPasscodePage()),
  ];
}
