import 'package:access_key/ui/config/sizes.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: kButtonSize,
      child: Icon(
        Icons.backspace,
        size: 40,
      ),
    );
  }
}
