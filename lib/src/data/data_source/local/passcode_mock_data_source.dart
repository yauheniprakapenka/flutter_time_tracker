import 'i_passcode_local_data_source.dart';

class PasscodeMockDataSource implements IPasscodeLocalDataSource {
  var _storagePasscode = '2222';

  @override
  Future<bool> passcodeMatch(String userPasscode) async {
    return userPasscode == _storagePasscode ? true : false;
  }

  @override
  Future<void> createPasscode(String userPasscode) async {
    _storagePasscode = userPasscode;
  }
}
