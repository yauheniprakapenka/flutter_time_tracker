enum PasscodeResult {
  /// Entering passcode.
  passcodeEntring,

  /// Success result. Entered passcode matches with the saved passcode.
  matches,

  /// Error result. Entered passcode not matches with the saved passcode.
  notMatches,
}

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
