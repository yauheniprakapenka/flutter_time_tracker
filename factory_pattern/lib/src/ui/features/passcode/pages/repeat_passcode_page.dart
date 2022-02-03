import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../../../passcode.dart';
import '../../../../app/bloc/passcode_bloc/passcode_bloc.dart';
import '../../../../app/bloc/passcode_bloc/passcode_state.dart';
import '../../../../app/localization/i_localization.dart';
import '../composites/passcode_indicator_view_with_animation.dart';
import '../widgets/task_text.dart';

class RepeatPasscodePage extends StatelessWidget {
  const RepeatPasscodePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Align(
            alignment: Alignment.centerLeft,
            child: _BackButton(),
          ),
          SizedBox(height: 22),
          _TaskTextView(),
          SizedBox(height: 22),
          PasscodeIndicatorViewWithAnimation(),
          SizedBox(height: 52),
          NumberPanel(),
        ],
      ),
    );
  }
}

class _TaskTextView extends StatelessWidget {
  const _TaskTextView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<PasscodeBloc, PasscodeState>(builder: (context, passcodeState) {
      final localization = UIServiceLocator.instance.get<ILocalization>();
      return passcodeState.passcodeResult == PasscodeResult.passcodeNotMatches
          ? TaskText(text: localization.passcodeEnteredIncorrectly, hasErrorStyle: true)
          : TaskText(text: localization.repeatPasscode);
    });
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return TextButton(
      child: const Text('Отмена'),
      onPressed: () {
        throw UnimplementedError();
      },
    );
  }
}
