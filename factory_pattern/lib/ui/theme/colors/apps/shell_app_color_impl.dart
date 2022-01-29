import 'package:flutter/material.dart';

import '../interface/i_app_color.dart';

class ShellAppColorImpl implements IAppColor {
  @override
  Color get surface => const Color(0xFFE5E5EA);

  @override
  Color get onSurface => const Color(0xFF000000);
}
