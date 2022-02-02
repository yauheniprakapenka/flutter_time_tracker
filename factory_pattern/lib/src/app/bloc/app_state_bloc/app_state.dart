import '../../../ui/features/passcode/models/passcode.dart';
import '../../../ui/features/passcode/models/passcode_flow.dart';

class AppState {
  final PasscodeFlow passcodeFlow;
  final Passcode passcode;

  const AppState({required this.passcode, required this.passcodeFlow});

  AppState copyWith({Passcode? passcode, PasscodeFlow? passcodeFlow}) {
    return AppState(
      passcode: passcode ?? this.passcode,
      passcodeFlow: passcodeFlow ?? this.passcodeFlow,
    );
  }
}
