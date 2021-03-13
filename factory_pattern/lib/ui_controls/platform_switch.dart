import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

abstract class PlatformSwitch {
  factory PlatformSwitch(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return _IosSwitch();
      default:
        return _AndroidSwitch();
    }
  }

  Widget build({
    @required bool value,
    @required ValueChanged<bool> onChanged,
  });
}

class _IosSwitch implements PlatformSwitch {
  @override
  Widget build({
    @required bool value,
    @required ValueChanged<bool> onChanged,
  }) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
    );
  }
}

class _AndroidSwitch implements PlatformSwitch {
  @override
  Widget build({
    @required bool value,
    @required ValueChanged<bool> onChanged,
  }) {
    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }
}
