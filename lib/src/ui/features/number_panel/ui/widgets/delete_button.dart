import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../app/config/number_panel_config.dart';

class DeleteButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  const DeleteButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(context) {
    final config = GetIt.I.get<NumberPanelConfig>();
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        width: config.buttonSize,
        height: config.buttonSize,
        child: config.deleteIcon,
      ),
    );
  }
}
