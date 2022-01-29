import 'package:flutter/material.dart';

import 'ui/app/passcode_app.dart';
import 'ui/services/ui_service_locator.dart';

void main() {
  UIServiceLocator.instance.initialize();
  runApp(const PasscodeApp());
}
