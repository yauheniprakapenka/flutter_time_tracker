import '../../entities/entities.dart';
import '../../providers/passcode_provider/bloc.dart';

PasscodeState getLoginWithAppPasscodeInitialState() {
  return const PasscodeState(
    passcodeFlow: PasscodeFlow.loginWithPasscode,
    passcodeUseCase: PasscodeUseCase.enterCurrentPasscode,
  );
}
