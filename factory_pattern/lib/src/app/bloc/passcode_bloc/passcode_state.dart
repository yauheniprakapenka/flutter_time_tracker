import '../../../../passcode.dart';
import '../../../ui/features/passcode/models/passcode.dart';
import '../../../ui/features/passcode/models/passcode_flow.dart';

class PasscodeState {
  final PasscodeFlow passcodeFlow;
  final PasscodeResult passcodeResult;
  final Passcode passcode;

  const PasscodeState({
    required this.passcodeResult,
    required this.passcodeFlow,
    required this.passcode,
  });

  PasscodeState copyWith({
    PasscodeFlow? passcodeFlow,
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
