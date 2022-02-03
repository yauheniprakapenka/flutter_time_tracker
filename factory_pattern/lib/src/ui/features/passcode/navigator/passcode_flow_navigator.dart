import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/passcode_bloc/passcode_bloc.dart';
import '../../../../app/bloc/passcode_bloc/passcode_state.dart';
import '../models/passcode_flow.dart';
import '../pages/create_passcode_page/create_passcode_page.dart';
import '../pages/delegates/no_animation_transition_delegate.dart';
import '../pages/repeat_passcode_page.dart';

class PasscodeFlowNavigator extends StatelessWidget {
  const PasscodeFlowNavigator({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<PasscodeBloc, PasscodeState>(
      builder: (context, passcodeState) {
        return Navigator(
          transitionDelegate: NoAnimationTransitionDelegate(),
          pages: [
            if (passcodeState.passcodeFlow == PasscodeFlow.repeatingPasscode) const MaterialPage(child: RepeatPasscodePage()),
            if (passcodeState.passcodeFlow == PasscodeFlow.creatingPasscode) const MaterialPage(child: CreatePasscodePage()),
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
