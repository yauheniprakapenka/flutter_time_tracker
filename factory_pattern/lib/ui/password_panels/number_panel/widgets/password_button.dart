import 'package:flutter/material.dart';

import '../../../services/service_locator.dart';
import '../../../theme/size/interface/i_app_size.dart';

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
    final appSize = ServiceLocator.instance.get<IAppSize>();

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
          return Theme.of(context).colorScheme.surface;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return Theme.of(context).colorScheme.onSurface;
        }),
      ),
      onPressed: () {
        onPressed(titleNumber);
      },
      child: Center(
        child: Text(
          '$titleNumber',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
