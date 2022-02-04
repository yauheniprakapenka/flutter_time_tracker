import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/passcode_bloc/passcode_bloc.dart';
import '../../../../app/bloc/passcode_bloc/passcode_state.dart';
import '../models/passcode_flow.dart';
import '../models/passcode_use_case.dart';
import '../pages/create_passcode_page.dart';
import '../pages/enter_current_passcode_page.dart';
import '../pages/repeat_passcode_page.dart';
import 'delegates/no_animation_transition_delegate.dart';

class PasscodeFlowNavigator extends StatelessWidget {
  const PasscodeFlowNavigator({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<PasscodeBloc, PasscodeState>(
      builder: (context, state) {
        return Navigator(
          transitionDelegate: NoAnimationTransitionDelegate(),
          pages: [
            if (state.passcodeFlow == PasscodeFlow.createPasscode) ..._createPasscodePagesFlow(state.passcodeUseCase),
            if (state.passcodeFlow == PasscodeFlow.changePasscode) ..._changePasscodePagesFlow(state.passcodeUseCase),
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

List<MaterialPage> _createPasscodePagesFlow(PasscodeUseCase useCase) {
  return [
    if (useCase == PasscodeUseCase.repeatPasscode) const MaterialPage(child: RepeatPasscodePage()),
    if (useCase == PasscodeUseCase.createPasscode) const MaterialPage(child: CreatePasscodePage()),
  ];
}

List<MaterialPage> _changePasscodePagesFlow(PasscodeUseCase useCase) {
  return [
    if (useCase == PasscodeUseCase.enterCurrentPasscode) const MaterialPage(child: EnterCurrentPasscodePage()),
    if (useCase == PasscodeUseCase.createPasscode) const MaterialPage(child: CreatePasscodePage()),
    if (useCase == PasscodeUseCase.repeatPasscode) const MaterialPage(child: RepeatPasscodePage()),
  ];
}
