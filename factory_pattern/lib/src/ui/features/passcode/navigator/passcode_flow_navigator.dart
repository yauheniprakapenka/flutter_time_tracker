import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/passcode_bloc/passcode_bloc.dart';
import '../../../../app/bloc/passcode_bloc/passcode_state.dart';
import '../models/passcode_flow.dart';
import '../models/passcode_use_case.dart';
import '../pages/create_passcode_page/create_passcode_page.dart';
import '../pages/delegates/no_animation_transition_delegate.dart';
import '../pages/repeat_passcode_page.dart';

final scenario = PasscodeFlow.createPasscode;

class PasscodeFlowNavigator extends StatelessWidget {
  const PasscodeFlowNavigator({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<PasscodeBloc, PasscodeState>(
      builder: (context, passcodeState) {
        return Navigator(
          transitionDelegate: NoAnimationTransitionDelegate(),
          pages: [
            if (scenario == PasscodeFlow.createPasscode) ..._createPasscodePagesScenario(passcodeState.passcodeFlow),
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;
            return true;
          },
        );
      },
    );
  }
}

List<MaterialPage> _createPasscodePagesScenario(PasscodeUseCase passcodeFlow) {
  return [
    if (passcodeFlow == PasscodeUseCase.repeatePasscode) const MaterialPage(child: RepeatPasscodePage()),
    if (passcodeFlow == PasscodeUseCase.createPasscode) const MaterialPage(child: CreatePasscodePage()),
  ];
}
