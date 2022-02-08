import 'package:flutter/material.dart';
import 'package:passcode_navigator/passcode_navigator.dart';

import 'passcode_navigator_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  return PasscodeNavigator(
                    passcodeNavigatorConfig: passcodeNavigatorConfig.copyWith(
                      passcodeFlow: PasscodeFlow.createPasscode,
                    ),
                    onResult: (result) {
                      debugPrint('Результ снаружи ${result.toString()}');
                    },
                    onCancelPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
