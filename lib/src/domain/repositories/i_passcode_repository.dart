abstract class IPasscodeRepository {
  /// Return `true` if user entered passcode matches with the saved passcode in storage.
  Future<bool> passcodeMatch(String userPasscode);

  Future<void> createPasscode(String userPasscode);
}
