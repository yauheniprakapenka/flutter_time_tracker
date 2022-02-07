// TODO(e): Передавать локализацию
// TODO(e): Добавить отображение логотипа
// TODO(e): Добавить layout builder
// TODO(e): В сценарии "Изменить ключ доступа" два раза получаем успешный результат так как в нем экран от сцераний войти по ключу доступа

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'src/app/facade/passcode_app.dart';

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
                    onResult: (result) {
                      debugPrint('Результа снаружи ${result.toString()}');
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
