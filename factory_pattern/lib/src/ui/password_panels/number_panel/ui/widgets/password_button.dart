import 'package:flutter/material.dart';

import '../../../../../app/services/ui_service_locator.dart';
import '../../../../../app/theme/colors/i_app_color.dart';
import '../../../../../app/theme/sizes/i_app_size.dart';

class PasswordButton extends StatelessWidget {
  final int titleNumber;
  final Function(int pressedNumber) onPressed;

  const PasswordButton({
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
          return Size(appSize.passwordButtonSize, appSize.passwordButtonSize);
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              appSize.passwordButtonSize * 0.5,
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
