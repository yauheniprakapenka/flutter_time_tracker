import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'i_passcode_local_data_source.dart';

class PasscodeSecureStorageDataSource implements IPasscodeLocalDataSource {
  final _storage = const FlutterSecureStorage();
  static const _passcodeKey = '_passcodeKey';

  @override
  Future<bool> passcodeMatch(String userPasscode) async {
    final storagePasscode = await _storage.read(key: _passcodeKey);
    print('Storage Pasccode: $storagePasscode');
    print('User Pasccode: $userPasscode');
    return userPasscode == storagePasscode ? true : false;
  }

  @override
  Future<void> createPasscode(String userPasscode) async {
    await _storage.write(key: _passcodeKey, value: userPasscode);
  }
}
