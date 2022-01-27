// ignore_for_file: prefer-extracting-callbacks

import 'package:flutter/material.dart';

class ButtonPaddingDecorator extends StatelessWidget {
  final Widget child;

  const ButtonPaddingDecorator({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: child,
    );
  }
}
