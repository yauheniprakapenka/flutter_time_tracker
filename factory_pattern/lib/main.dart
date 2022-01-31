import 'package:data/data.dart';
import 'package:flutter/material.dart';

import 'src/app/passcode_app.dart';
import 'src/app/services/ui_service_locator.dart';

void main() {
  UIServiceLocator.instance.init();
  DataServiceLocator.instance.init();
  runApp(const PasscodeApp());
}
