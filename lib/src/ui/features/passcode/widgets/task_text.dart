import 'package:flutter/material.dart';

import '../../../../app/di/color_service_locator.dart';
import '../../../shared/theme/colors/i_color.dart';

class TaskText extends StatelessWidget {
  final String text;
  final bool hasErrorStyle;

  const TaskText({
    Key? key,
    required this.text,
    this.hasErrorStyle = false,
  }) : super(key: key);

  @override
  Widget build(context) {
    final appColor = ColorServiceLocator.instance.get<IColor>();
    return Text(
      text,
      style: TextStyle(
        fontSize: 21.0,
        color: hasErrorStyle ? appColor.error : appColor.onPrimaryVariant,
      ),
    );
  }
}
