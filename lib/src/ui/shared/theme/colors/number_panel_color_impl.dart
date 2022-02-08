import 'package:flutter/material.dart';

import '../../../di/di.dart';
import '../../../features/number_panel/app/theme/i_number_panel_color.dart';
import 'i_color.dart';

class NumberPanelColorImpl implements INumberPanelColor {
  final _colors = ColorServiceLocator.instance.get<IColor>();

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
