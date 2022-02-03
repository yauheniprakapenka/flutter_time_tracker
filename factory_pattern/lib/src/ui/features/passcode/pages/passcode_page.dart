import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../../app/bloc/passcode_bloc/passcode_bloc.dart';
import '../../../../app/bloc/passcode_bloc/passcode_state.dart';
import '../composites/passcode_indicator_view.dart';
// import '../models/passcode_flow.dart';
import '../widgets/text_info.dart';

class PasscodePage extends StatelessWidget {
  const PasscodePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<PasscodeBloc, PasscodeState>(
          builder: (context, state) {
            // if (state.passcodeFlow == PasscodeFlow.gettingPasscodeFromStorage) {
            //   return const Center(child: CircularProgressIndicator.adaptive());
            // } 

            // if (state.passcodeFlow == PasscodeFlow.createNewPasscode) {
            //   //
            // }

            return Column(
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
                const TextInfo(text: 'Введите ключ доступа'),
                const SizedBox(height: 22),
                const PasscodeIndicatorView(),
                const SizedBox(height: 52),
                const NumberPanel(),
              ],
            );
          },
        ),
      ),
    );
  }
}
