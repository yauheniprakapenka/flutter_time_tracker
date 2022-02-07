import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Widget? child;

  const Logo({Key? key, this.child}) : super(key: key);

  @override
  Widget build(context) {
    const iPhoneSEHeight = 667.0;
    if (child == null) return const SizedBox();
    if (MediaQuery.of(context).size.height < iPhoneSEHeight) return const SizedBox();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox.square(dimension: 68, child: child),
        const SizedBox(height: 22),
      ],
    );
  }
}
