// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';

import '../interface/i_app_theme.dart';

class ShellAppThemeImpl implements IAppTheme {
  @override
  ThemeData build() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        surface: Color(0xFFE5E5EA),
        onSurface: Color(0xFF000000),
      ),
    );
  }
}
