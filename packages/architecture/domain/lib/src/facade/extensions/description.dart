import '../../entities/passcode_result.dart';

extension Description on PasscodeResult {
  String getDescription() {
    switch (this) {
      case PasscodeResult.passcodeEntring:
        return 'Пользователь вводит ключ доступа';
      case PasscodeResult.matches:
        return 'Ключ доступа совпадает';
      case PasscodeResult.notMatches:
        return 'Ключ доступа не совпадает';
    }
  }
}
