enum PasscodeResult {
  /// Entering passcode.
  passcodeEntry,

  /// Entered passcode matches with the saved passcode.
  passcodeMatches,

  /// Entered passcode not matches with the saved passcode.
  passcodeNotMatches,
}

// TODO поправить описание, что пароли совпадают с хранилищем или с изменением кода
