import 'package:flutter/material.dart';

import '../../../config/sizes.dart';

class NumberButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  const NumberButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: kButtonSize,
        height: kButtonSize,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
