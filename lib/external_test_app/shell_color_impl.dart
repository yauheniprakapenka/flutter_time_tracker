import 'package:flutter/material.dart';

import '../src/ui/shared/theme/colors/i_color.dart';

class ShellColorImpl implements IColor {
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

  @override
  Color get success => const Color(0xFF03B325);
}
