import '../../../../passcode.dart';
// import '../../../ui/features/passcode/models/passcode_flow.dart';

class PasscodeState {
  // final PasscodeFlow passcodeFlow;
  final PasscodeResult passcodeResult;
  final String currentEnteredPasscode;

  const PasscodeState({
    required this.passcodeResult,
    // required this.passcodeFlow,
    this.currentEnteredPasscode = '',
  });

  PasscodeState copyWith({
    // PasscodeFlow? passcodeFlow,
    PasscodeResult? passcodeResult,
    String? currentEnteredPasscode,
  }) {
    return PasscodeState(
      // passcodeFlow: passcodeFlow ?? this.passcodeFlow,
      passcodeResult: passcodeResult ?? this.passcodeResult,
      currentEnteredPasscode:
          currentEnteredPasscode ?? this.currentEnteredPasscode,
    );
  }
}
