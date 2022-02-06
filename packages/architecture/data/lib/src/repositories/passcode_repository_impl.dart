import 'package:domain/domain.dart';

import '../data_source/local/i_passcode_local_data_source.dart';

class PasscodeRepositoryImpl implements IPasscodeRepository {
  final IPasscodeLocalDataSource _localDataSource;

  const PasscodeRepositoryImpl({
    required IPasscodeLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<bool> passcodeHasMatch(String userPasscode) async {
    return _localDataSource.passcodeHasMatch(userPasscode);
  }

  @override
  Future<bool> isPasscodeExist() async {
    return _localDataSource.isPasscodeExist();
  }
}
