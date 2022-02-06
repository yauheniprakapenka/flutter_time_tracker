import '../../domain.dart';
import '../config/intial_passcode_states/change_passcode_initial_state.dart';
import '../config/intial_passcode_states/create_passcode_initial_state.dart';
import '../config/intial_passcode_states/login_with_passcode_initial_state.dart';

enum PasscodeFlow {
  createPasscode,
  changePasscode,
  loginWithPasscode,
}

extension GetPasscodeFlow on PasscodeFlow {
  PasscodeState get() {
    switch (this) {
      case PasscodeFlow.createPasscode:
        return getCreatePasscodeInitialState();
      case PasscodeFlow.changePasscode:
        return getChangePasscodeInitialState();
      case PasscodeFlow.loginWithPasscode:
       return getLoginWithAppPasscodeInitialState();
    }
  }
}
