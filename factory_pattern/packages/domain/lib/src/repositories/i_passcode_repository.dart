abstract class IPasscodeRepository {
  /// Return `true` if user entered passcode matches with the saved passcode in storage.
  Future<bool> passcodeHasMatch(String userPasscode);

  /// Return `true` if passcode exist in storage.
  Future<bool> isPasscodeExist();
}
