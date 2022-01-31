import 'package:flutter/material.dart';

import 'app/passcode_app.dart';
import 'app/services/service_locator.dart';

void main() {
  ServiceLocator.instance.initialize();
  runApp(const PasscodeApp());
}
