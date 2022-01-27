import 'package:access_key/ui/config/sizes.dart';
import 'package:flutter/material.dart';

class EmptySpaceButton extends StatelessWidget {
  const EmptySpaceButton({Key? key}) : super(key: key);
  
  @override
  Widget build(context) {
    return SizedBox.square(dimension: kButtonSize);
  }
}
