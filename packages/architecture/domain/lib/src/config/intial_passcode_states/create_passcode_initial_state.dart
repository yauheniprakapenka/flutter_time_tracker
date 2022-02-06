import '../../entities/entities.dart';
import '../../providers/passcode_provider/bloc.dart';

PasscodeState getCreatePasscodeInitialState() {
  return const PasscodeState(
    passcodeFlow: PasscodeFlow.createPasscode,
    passcodeUseCase: PasscodeUseCase.createPasscode,
  );
}
