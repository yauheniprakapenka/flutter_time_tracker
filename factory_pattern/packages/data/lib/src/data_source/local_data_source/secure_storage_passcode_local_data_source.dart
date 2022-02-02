import 'i_passcode_local_data_source.dart';

class SecureStoragePasscodeLocalDataSource implements IPasscodeLocalDataSource {
  @override
  Future<bool> passcodeHasMatch(String userPasscode) async {
    return userPasscode == '2222' ? true : false;
  }

  @override
  Future<bool> isPasscodeExist() async {
    await Future.delayed(const Duration(seconds: 1));
    return false;
  }
}
