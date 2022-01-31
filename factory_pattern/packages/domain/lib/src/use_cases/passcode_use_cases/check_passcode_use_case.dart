import '../../repositories/i_passcode_repository.dart';

class CheckPasscodeUseCase {
  final IPasscodeRepository _passcodeRepository;

  const CheckPasscodeUseCase({required IPasscodeRepository passcodeRepository})
      : _passcodeRepository = passcodeRepository;

  Future<bool> call(String passcode) {
    return _passcodeRepository.checkPasscode(passcode);
  }
}
