import 'package:flutter/material.dart';

import '../../../di/di.dart';
import '../colors/i_color.dart';

class AppThemeData {
  final _appColor = ColorServiceLocator.instance.get<IColor>();

  ThemeData call() {
    return ThemeData(
      scaffoldBackgroundColor: _appColor.background,
      textButtonTheme: _textButtonThemeData(),
    );
  }

  TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return _appColor.onPrimaryVariant;
        }),
        textStyle: MaterialStateProperty.resolveWith((states) {
          return const TextStyle(
            fontSize: 18.0,
          );
        }),
      ),
    );
  }
}
