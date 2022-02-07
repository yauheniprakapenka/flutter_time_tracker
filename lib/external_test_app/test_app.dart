// TODO(e): Добавить отображение логотипа
// TODO(e): Добавить layout builder

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../src/app/facade/passcode_app.dart';
import 'shell_color_impl.dart';
import 'shell_localization_impl.dart';

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

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
                    passcodeFlow: PasscodeFlow.changePasscode,
                    passcodeLength: 4,
                    localization: ShellLocalizationImpl(),
                    color: ShellColorImpl(),
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
