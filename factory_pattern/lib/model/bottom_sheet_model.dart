import 'package:flutter/material.dart';

class BottomSheetButtonModel {
  /// `iOS+Android` buttonTitle displays the name of the button. Required parameter.
  ///
  /// `iOS+Android` onPressed calls the method. Required parameter.
  ///
  /// `iOS` isDestructive button have a red title. Optional parameter.
  ///
  /// `iOS` isDefaultAction button have bold weight.
  ///
  /// `Android` Icon displays to the left of the button title.
  BottomSheetButtonModel({
    @required this.buttonTitle,
    @required this.onPressed,
    this.isDestructive = false,
    this.isDefaultAction = false,
    this.iconData,
  });

  final String buttonTitle;
  final VoidCallback onPressed;
  final bool isDestructive;
  final bool isDefaultAction;
  final IconData iconData;
}
