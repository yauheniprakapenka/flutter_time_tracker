enum PasscodeResult {
  /// Entering passcode.
  passcodeEntry,

  /// Entered passcode matches with the saved passcode.
  success,

  /// Entered passcode not matches with the saved passcode.
  fail,
}
