import 'package:flutter/material.dart';

import '../../../config/sizes.dart';

class EmptySpaceButton extends StatelessWidget {
  const EmptySpaceButton({Key? key}) : super(key: key);
  
  @override
  Widget build(context) {
    return const SizedBox.square(dimension: kButtonSize);
  }
}
