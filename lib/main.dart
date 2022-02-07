import 'package:flutter/material.dart';

import 'external_test_app/test_app.dart';
import 'src/app/di/app_color_service_locator.dart';

void main() {
  AppColorServiceLocator.instance.register();
  runApp(const MaterialApp(home: TestApp()));
}
