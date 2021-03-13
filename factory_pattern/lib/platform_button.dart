import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

abstract class PlatformButton {
  factory PlatformButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return IosButton();
      default:
        return AndroidButton();
    }
  }

  Widget build({
    @required BuildContext context,
    @required Widget child,
    @required VoidCallback onPressed,
  });
}

class IosButton implements PlatformButton {
  @override
  Widget build({
    BuildContext context,
    Widget child,
    VoidCallback onPressed,
  }) {
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
    );
  }
}

class AndroidButton implements PlatformButton {
  @override
  Widget build({
    @required BuildContext context,
    @required Widget child,
    @required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
