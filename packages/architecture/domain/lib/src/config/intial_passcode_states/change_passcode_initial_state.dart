import '../../entities/entities.dart';
import '../../providers/passcode_provider/bloc.dart';

PasscodeState getChangePasscodeInitialState() {
  return const PasscodeState(
    passcodeFlow: PasscodeFlow.changePasscode,
    passcodeUseCase: PasscodeUseCase.enterCurrentPasscode,
  );
}
