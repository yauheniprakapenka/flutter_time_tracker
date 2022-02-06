import 'package:flutter/material.dart';

import 'src/app/di/ui_service_locator.dart';
import 'src/app/passcode_app.dart';

void main() {
  UIServiceLocator.instance.init();
  runApp(const PasscodeApp());
}
