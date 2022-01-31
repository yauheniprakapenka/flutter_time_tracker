abstract class IPasscodeRepository {
  /// Return `true` if entered passcode matches with the saved passcode.
  Future<bool> checkPasscode(String passcode);
}
