import 'package:flutter/material.dart';

import 'ui/app/passcode_app.dart';
import 'ui/services/service_locator.dart';

void main() {
  ServiceLocator.instance.initialize();
  runApp(const PasscodeApp());
}
