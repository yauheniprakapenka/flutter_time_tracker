import 'package:flutter/material.dart';
import 'package:number_panel/number_panel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passcode/passcode.dart';
import 'package:passcode/src/app/bloc/passcode_bloc/passcode_bloc.dart';
import 'package:passcode/src/app/bloc/passcode_bloc/passcode_state.dart';

import '../composites/passcode_indicator_view_with_animation.dart';
import '../widgets/task_text.dart';

class RepeatPasscodePage extends StatelessWidget {
  const RepeatPasscodePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                throw UnimplementedError();
              },
            ),
          ),
          const SizedBox(height: 22),
          BlocBuilder<PasscodeBloc, PasscodeState>(builder: (context, passcodeState) {
            return TaskText(text: passcodeState.passcodeResult == PasscodeResult.passcodeNotMatches ? 'Пароли не совадают' : 'Повторите ключ доступа');
          }),
          const SizedBox(height: 22),
          const PasscodeIndicatorViewWithAnimation(),
          const SizedBox(height: 52),
          const NumberPanel(),
        ],
      ),
    );
  }
}
