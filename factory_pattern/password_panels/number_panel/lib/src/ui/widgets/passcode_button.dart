import 'package:flutter/material.dart';
import 'package:passcode/passcode.dart';

class PasscodeButton extends StatelessWidget {
  final int titleNumber;
  final Function(int pressedNumber) onPressed;

  const PasscodeButton({
    Key? key,
    required this.titleNumber,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(context) {
    final serviceLocator = UIServiceLocator.instance;
    final appSize = serviceLocator.get<IAppSize>();
    final appColor = serviceLocator.get<IAppColor>();

    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith((states) {
          return Size(appSize.passcodeButtonSize, appSize.passcodeButtonSize);
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              appSize.passcodeButtonSize * 0.5,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return appColor.primary;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return appColor.onPrimary;
        }),
      ),
      onPressed: () {
        onPressed(titleNumber);
      },
      child: Center(
        child: Text(
          '$titleNumber',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
