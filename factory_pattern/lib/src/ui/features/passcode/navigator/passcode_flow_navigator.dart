import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/passcode_bloc/passcode_bloc.dart';
import '../../../../app/bloc/passcode_bloc/passcode_state.dart';
import '../models/passcode_flow.dart';
import 'delegates/no_animation_transition_delegate.dart';
import 'flows/change_passcode_flow.dart';
import 'flows/create_passcode_flow.dart';
import 'flows/login_with_passcode_flow.dart';

class PasscodeFlowNavigator extends StatelessWidget {
  const PasscodeFlowNavigator({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<PasscodeBloc, PasscodeState>(
      builder: (context, state) {
        return Navigator(
          transitionDelegate: NoAnimationTransitionDelegate(),
          pages: [
            if (state.passcodeFlow == PasscodeFlow.createPasscode) ...buildCreatePasscodeFlow(state.passcodeUseCase),
            if (state.passcodeFlow == PasscodeFlow.changePasscode) ...buildChangePasscodeFlow(state.passcodeUseCase),
            if (state.passcodeFlow == PasscodeFlow.loginWithPasscode) ...buildLoginWithPasscode(),
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
