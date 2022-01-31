import '../../../../models/passcode_result.dart';

class NumberPanelState {
  /// Currently entered password.
  ///
  /// Examples: '748', '2222', '', '9'.
  final String currentPassword;

  final PasscodeResult passcodeResult;

  const NumberPanelState({
    required this.currentPassword,
    this.passcodeResult = PasscodeResult.input,
  });

  NumberPanelState copyWith({
    String? currentPassword,
    PasscodeResult? passcodeResult,
  }) {
    return NumberPanelState(
      currentPassword: currentPassword ?? this.currentPassword,
      passcodeResult: passcodeResult ?? this.passcodeResult,
    );
  }
}
