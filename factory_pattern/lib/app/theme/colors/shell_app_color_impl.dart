import 'package:flutter/material.dart';

import 'i_app_color.dart';

class ShellAppColorImpl implements IAppColor {
  @override
  Color get primary => const Color(0xFFE5E5EA);

  @override
  Color get onPrimary => const Color(0xFF000000);

  @override
  Color get onPrimaryVariant => const Color(0xFF404040);

  @override
  Color get error => const Color(0xFFEE4040);

  @override
  Color get background => const Color(0xFFFFFFFF);
}
