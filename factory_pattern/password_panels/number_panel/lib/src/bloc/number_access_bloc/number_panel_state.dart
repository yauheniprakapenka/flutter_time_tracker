import 'package:passcode/passcode.dart';

class NumberPanelState {
  /// Currently entered passcode.
  ///
  /// Examples: '748', '2222', '', '9'.
  final String currentPasscode;

  final PasscodeResult passcodeResult;

  const NumberPanelState({
    required this.currentPasscode,
    this.passcodeResult = PasscodeResult.input,
  });

  NumberPanelState copyWith({
    String? currentPasscode,
    PasscodeResult? passcodeResult,
  }) {
    return NumberPanelState(
      currentPasscode: currentPasscode ?? this.currentPasscode,
      passcodeResult: passcodeResult ?? this.passcodeResult,
    );
  }
}
