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
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      child: child,
    );
  }
}
