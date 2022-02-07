import 'package:flutter/material.dart';

import 'src/app/di/ui_service_locator.dart';
import 'test_app.dart';

void main() {
  UIServiceLocator.instance.register();
  runApp(const MaterialApp(home: NewApp()));
}
