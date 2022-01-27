import 'package:flutter/material.dart';

class ButtonDecorator extends StatelessWidget {
  final Widget button;

  ButtonDecorator({Key? key, required this.button}) : super(key: key);

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: button,
    );
  }
}
