import 'package:domain/domain.dart';

import '../data_source/local/i_passcode_local_data_source.dart';

class PasscodeRepositoryImpl implements IPasscodeRepository {
  final IPasscodeLocalDataSource _localDataSource;

  const PasscodeRepositoryImpl({
    required IPasscodeLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<bool> passcodeMatch(String userPasscode) async {
    return _localDataSource.passcodeMatch(userPasscode);
  }

  @override
  Future<void> createPasscode(String userPasscode)async {
    await _localDataSource.createPasscode(userPasscode);
  }
}
