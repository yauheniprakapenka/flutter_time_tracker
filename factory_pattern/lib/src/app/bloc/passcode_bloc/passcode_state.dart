import '../../../../passcode.dart';
import '../../../ui/features/passcode/models/passcode.dart';
import '../../../ui/features/passcode/models/passcode_use_case.dart';

class PasscodeState {
  final PasscodeUseCase passcodeFlow;
  final PasscodeResult passcodeResult;
  final Passcode passcode;

  const PasscodeState({
    required this.passcodeResult,
    required this.passcodeFlow,
    required this.passcode,
  });

  PasscodeState copyWith({
    PasscodeUseCase? passcodeFlow,
    PasscodeResult? passcodeResult,
    Passcode? passcode,
  }) {
    return PasscodeState(
      passcodeFlow: passcodeFlow ?? this.passcodeFlow,
      passcodeResult: passcodeResult ?? this.passcodeResult,
      passcode: passcode ?? this.passcode,
    );
  }
}
