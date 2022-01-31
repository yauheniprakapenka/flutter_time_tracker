import '../../repositories/i_passcode_repository.dart';

class CheckPasscodeHasMatchUseCase {
  final IPasscodeRepository _passcodeRepository;

  const CheckPasscodeHasMatchUseCase({required IPasscodeRepository passcodeRepository})
      : _passcodeRepository = passcodeRepository;

  Future<bool> call(String passcode) {
    return _passcodeRepository.checkPasscodeHasMatch(passcode);
  }
}
