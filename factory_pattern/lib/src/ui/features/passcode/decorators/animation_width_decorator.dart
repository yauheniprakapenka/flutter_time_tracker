import 'package:flutter/material.dart';

import '../builders/width_animation_builder.dart';

class AnimationWidthDecorator extends StatelessWidget {
  final AnimationController leftWidthCntrl;
  final AnimationController rightWidthCntrl;
  final Widget child;

  late final Animation<double> _leftWidthAnimation = buildWidthAnimation(leftWidthCntrl);
  late final Animation<double> _rightWidthAnimation = buildWidthAnimation(rightWidthCntrl);

  AnimationWidthDecorator({
    Key? key,
    required this.leftWidthCntrl,
    required this.rightWidthCntrl,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: leftWidthCntrl,
            builder: (_, __) {
              return SizedBox(width: _leftWidthAnimation.value);
            }),
        child,
        AnimatedBuilder(
            animation: rightWidthCntrl,
            builder: (_, __) {
              return SizedBox(width: _rightWidthAnimation.value);
            }),
      ],
    );
  }
}
