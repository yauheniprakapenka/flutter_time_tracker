import '../../../ui/features/passcode/models/passcode.dart';
import '../../../ui/features/passcode/models/passcode_flow.dart';

class PasscodeState {
  final PasscodeFlow passcodeFlow;
  final Passcode passcode;

  const PasscodeState({required this.passcode, required this.passcodeFlow});

  PasscodeState copyWith({PasscodeFlow? passcodeFlow, Passcode? passcode}) {
    return PasscodeState(
      passcodeFlow: passcodeFlow ?? this.passcodeFlow,
      passcode: passcode ?? this.passcode,
    );
  }
}
