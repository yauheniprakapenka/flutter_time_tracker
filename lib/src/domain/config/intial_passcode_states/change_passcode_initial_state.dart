import '../../../domain/entities/entities.dart';
import '../../../domain/providers/passcode_provider/passcode_state.dart';

PasscodeState getChangePasscodeInitialState() {
  return const PasscodeState(
    passcodeFlow: PasscodeFlow.changePasscode,
    passcodeUseCase: PasscodeUseCase.enterCurrentPasscode,
  );
}
