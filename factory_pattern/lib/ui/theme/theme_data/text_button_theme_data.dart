import 'package:flutter/material.dart';

import '../../services/ui_service_locator.dart';
import '../colors/interface/i_app_color.dart';

TextButtonThemeData textButtonThemeData() {
  final appColor = UIServiceLocator.instance.get<IAppColor>();
  return TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return appColor.onPrimaryVariant;
      }),
      textStyle: MaterialStateProperty.resolveWith((states) {
        return const TextStyle(
          fontSize: 18.0,
        );
      }),
    ),
  );
}
