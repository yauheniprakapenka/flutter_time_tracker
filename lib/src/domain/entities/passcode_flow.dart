import '../../domain/config/intial_passcode_states/intial_passcode_states.dart';
import '../../domain/providers/passcode_provider/bloc.dart';

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
