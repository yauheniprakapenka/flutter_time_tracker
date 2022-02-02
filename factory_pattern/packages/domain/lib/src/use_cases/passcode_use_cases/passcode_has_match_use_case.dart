import '../../repositories/i_passcode_repository.dart';

/// Check a user entered passcode with existing in storage passcode.
class PasscodeHasMatchUseCase {
  final IPasscodeRepository _passcodeRepository;

  const PasscodeHasMatchUseCase({
    required IPasscodeRepository passcodeRepository,
  }) : _passcodeRepository = passcodeRepository;

  Future<bool> call(String userPasscode) async {
    return _passcodeRepository.passcodeHasMatch(userPasscode);
  }
}
