enum PasscodeResult {
  /// Entering passcode.
  passcodeEntring,

  /// Success result. Entered passcode matches with the saved passcode.
  matches,

  /// Error result. Entered passcode not matches with the saved passcode.
  notMatches,
}
