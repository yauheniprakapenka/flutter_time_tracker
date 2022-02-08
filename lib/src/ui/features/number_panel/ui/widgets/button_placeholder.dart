import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../app/config/number_panel_config.dart';

class ButtonPlaceholder extends StatelessWidget {
  const ButtonPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final buttonSize = GetIt.I.get<NumberPanelConfig>().buttonSize;
    return SizedBox.square(
      dimension: buttonSize,
    );
  }
}
