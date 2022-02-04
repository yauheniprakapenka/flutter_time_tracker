import '../../repositories/i_passcode_repository.dart';

class IsPasscodeExistUseCase {
  final IPasscodeRepository _passcodeRepository;

  const IsPasscodeExistUseCase({required IPasscodeRepository passcodeRepository})
      : _passcodeRepository = passcodeRepository;

  Future<bool> call() async {
    return _passcodeRepository.isPasscodeExist();
  }
}
