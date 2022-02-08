import 'package:flutter/material.dart';
import 'package:passcode_navigator/passcode.dart';
import 'package:passcode_navigator/src/domain/domain.dart';

import 'facebook_color_impl.dart';
import 'facebook_localization_impl.dart';

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
                    passcodeFlow: PasscodeFlow.changePasscode,
                    passcodeLength: 4,
                    localization: FacebookLocalizationImpl(),
                    color: FacebookColorImpl(),
                    logo: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/488px-Apple_logo_black.svg.png'),
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
