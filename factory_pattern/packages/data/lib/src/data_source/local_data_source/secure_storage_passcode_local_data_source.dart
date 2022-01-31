import 'i_passcode_local_data_source.dart';

class SecureStoragePasscodeLocalDataSource implements IPasscodeLocalDataSource {
  @override
  Future<bool> checkPasscode(String passcode) async {
    return passcode == '2222' ? true : false;
  }
}
