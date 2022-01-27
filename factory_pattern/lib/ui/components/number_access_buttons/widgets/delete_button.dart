import 'package:flutter/material.dart';

import '../../../config/sizes.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const SizedBox.square(
      dimension: kButtonSize,
      child: Icon(
        Icons.backspace,
        size: 40,
      ),
    );
  }
}
