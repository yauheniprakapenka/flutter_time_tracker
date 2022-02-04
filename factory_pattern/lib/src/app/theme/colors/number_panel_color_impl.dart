import 'package:flutter/material.dart';
import 'package:number_panel/number_panel.dart';

import 'shell_app_color_impl.dart';

class NumberPanelColorImpl implements INumberPanelColor {
  final _colors = ShellAppColorImpl();

  @override
  Color get background => _colors.background;

  @override
  Color get error => _colors.error;

  @override
  Color get onPrimary => _colors.onPrimary;

  @override
  Color get onPrimaryVariant => _colors.onPrimaryVariant;

  @override
  Color get primary => _colors.primary;

  @override
  Color get success => _colors.success;
}