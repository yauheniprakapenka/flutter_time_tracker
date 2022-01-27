import 'package:flutter/material.dart';

import '../../../config/sizes.dart';

class ButtonPlaceholder extends StatelessWidget {
  const ButtonPlaceholder({Key? key}) : super(key: key);
  
  @override
  Widget build(context) {
    return const SizedBox.square(dimension: kButtonSize);
  }
}
