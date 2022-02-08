import 'package:get_it/get_it.dart';

import '../../data/data_source/local/passcode_secure_storage_data_source.dart';
import '../../data/repositories/passcode_repository_impl.dart';
import '../../domain/domain.dart';

class PasscodeRepositoryServiceLocator {
  static final instance = PasscodeRepositoryServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void register() {
    if (!_getIt.isRegistered<IPasscodeRepository>()) {
      _getIt.registerLazySingleton<IPasscodeRepository>(
        () => PasscodeRepositoryImpl(
          localDataSource: PasscodeSecureStorageDataSource(),
        ),
      );
    }
  }
}
