import 'i_passcode_local_data_source.dart';

class PasscodeSecureStorageDataSource implements IPasscodeLocalDataSource {
  @override
  Future<bool> passcodeHasMatch(String userPasscode) async {
    return userPasscode == '2222' ? true : false;
  }

  @override
  Future<bool> isPasscodeExist() async {
    return false;
  }
}
