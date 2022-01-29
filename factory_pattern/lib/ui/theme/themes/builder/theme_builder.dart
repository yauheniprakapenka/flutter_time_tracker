import 'package:flutter/material.dart';

import '../interface/i_app_theme.dart';

class ThemeBuilder implements IAppTheme {
  final IAppTheme appTheme;

  const ThemeBuilder(this.appTheme);

  @override
  ThemeData build() {
    return appTheme.build();
  }
}
