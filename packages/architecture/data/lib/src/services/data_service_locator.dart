import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

import '../data_source/local_data_source/secure_storage_passcode_local_data_source.dart';
import '../repositories/passcode_repository_impl.dart';

class DataServiceLocator {
  static final instance = DataServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void init() {
    _getIt.registerLazySingleton<IPasscodeRepository>(
      () => PasscodeRepositoryImpl(
        localDataSource: SecureStoragePasscodeLocalDataSource(),
      ),
    );
  }
}
