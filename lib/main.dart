import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'src/app/di/ui_service_locator.dart';
import 'src/app/passcode_app.dart';

void main() {
  UIServiceLocator.instance.init();
  runApp(const MaterialApp(home: NewApp()));
}

// TODO(e): тестовый виджет
class NewApp extends StatelessWidget {
  const NewApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        child: const Text('Перейти'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PasscodeApp(
                  passcodeFlow: PasscodeFlow.loginWithPasscode,
                );
              },
            ),
          );
        },
      )),
    );
  }
}
