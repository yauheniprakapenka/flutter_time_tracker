
// TODO(e): тестовый виджет
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'src/app/passcode_app.dart';

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
            MaterialPageRoute(builder: (context) {
              return PasscodeApp(
                  passcodeFlow: PasscodeFlow.changePasscode,
                  passcodeLength: 4,
                  onCancelPressed: () {
                    Navigator.of(context).pop();
                  },
                );
            },
            ),
          );
        },
      )),
    );
  }
}
