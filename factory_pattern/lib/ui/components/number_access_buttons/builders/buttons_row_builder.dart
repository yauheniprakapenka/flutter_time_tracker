import 'package:flutter/material.dart';

class ButtonsRowBuilder extends StatelessWidget {
  final List<Widget> buttons;

  const ButtonsRowBuilder({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...buttons,
      ],
    );
  }
}
