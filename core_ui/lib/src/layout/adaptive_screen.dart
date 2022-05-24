import 'package:flutter/material.dart';

class AdaptiveScreen extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  static const _mobileMaxWidth = 1440.0;

  const AdaptiveScreen({
    required this.mobile,
    required this.desktop,
  });

  @override
  Widget build(context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return constraints.maxWidth >= _mobileMaxWidth ? desktop : mobile;
      },
    );
  }
}
