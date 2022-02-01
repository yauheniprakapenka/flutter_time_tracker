enum PasscodeResult {
  /// Entering passcode.
  input,

  /// Entered passcode matches with the saved passcode.
  success,

  /// Entered passcode not matches with the saved passcode.
  fail,
}
