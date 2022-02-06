import 'package:flutter/material.dart';

import '../../../../app/di/ui_service_locator.dart';
import '../colors/i_app_color.dart';

class AppThemeData {
  final _appColor = UIServiceLocator.instance.get<IAppColor>();

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
