import '../../../domain/entities/entities.dart';
import '../../../domain/providers/passcode_provider/passcode_state.dart';

PasscodeState getLoginWithAppPasscodeInitialState() {
  return const PasscodeState(
    passcodeFlow: PasscodeFlow.loginWithPasscode,
    passcodeUseCase: PasscodeUseCase.enterCurrentPasscode,
  );
}
