abstract class IPasscodeLocalDataSource {
  Future<bool> passcodeHasMatch(String userPasscode);

  Future<bool> isPasscodeExist();
}
