import 'package:flutter/material.dart';

import '../../core_ui.dart';

class AppTextStyle {
  static const _rubicFamily = 'Rubic';
  static const _textColor = AppColors.textColor;

  static const TextStyle rubicRegular10 = TextStyle(
    fontFamily: _rubicFamily,
    fontWeight: FontWeight.w400,
    fontSize: 10.0,
    color: _textColor,
  );

  static const TextStyle rubicRegular12 = TextStyle(
    fontFamily: _rubicFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    color: _textColor,
  );

  static const TextStyle rubicLight28 = TextStyle(
    fontFamily: _rubicFamily,
    fontWeight: FontWeight.w300,
    fontSize: 28.0,
    color: _textColor,
  );
}
