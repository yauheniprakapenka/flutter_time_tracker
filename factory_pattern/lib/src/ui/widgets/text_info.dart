import 'package:flutter/material.dart';

import '../../app/services/service_locator.dart';
import '../../app/theme/colors/i_app_color.dart';

class TextInfo extends StatelessWidget {
  final String text;
  final bool hasErrorStyle;

  const TextInfo({
    Key? key,
    required this.text,
    this.hasErrorStyle = false,
  }) : super(key: key);

  @override
  Widget build(context) {
    final appColor = ServiceLocator.instance.get<IAppColor>();
    return Text(
      text,
      style: TextStyle(
        fontSize: 21.0,
        color: hasErrorStyle ? appColor.error : appColor.onPrimaryVariant,
      ),
    );
  }
}
