import '../../../domain/entities/entities.dart';
import '../../../domain/providers/passcode_provider/passcode_state.dart';

PasscodeState getCreatePasscodeInitialState() {
  return const PasscodeState(
    passcodeFlow: PasscodeFlow.createPasscode,
    passcodeUseCase: PasscodeUseCase.createPasscode,
  );
}
