import 'package:flutter/material.dart';
import 'package:passcode/passcode.dart';

class ButtonPlaceholder extends StatelessWidget {
  const ButtonPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final appSize = UIServiceLocator.instance.get<IAppSize>();
    return SizedBox.square(
      dimension: appSize.passcodeButtonSize,
    );
  }
}
