abstract class IPasscodeLocalDataSource {
  Future<bool> passcodeMatch(String userPasscode);

  Future<void> createPasscode(String userPasscode);
}
