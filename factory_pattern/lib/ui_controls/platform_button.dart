import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

abstract class PlatformButton {
  factory PlatformButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return _IosButton();
      default:
        return _AndroidButton();
    }
  }

  Widget build({
    @required Widget child,
    @required VoidCallback onPressed,
  });
}

class _IosButton implements PlatformButton {
  @override
  Widget build({
    Widget child,
    VoidCallback onPressed,
  }) {
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
    );
  }
}

class _AndroidButton implements PlatformButton {
  @override
  Widget build({
    @required Widget child,
    @required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
