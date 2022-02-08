import 'package:get_it/get_it.dart';

import '../../domain/config/passcode_config.dart';

class PasscodeConfigServiceLocator {
  static final instance = PasscodeConfigServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void register(int passcodeLength) {
    if (!_getIt.isRegistered<PasscodeConfig>()) {
      _getIt.registerLazySingleton<PasscodeConfig>(() => PasscodeConfig(passcodeLength: passcodeLength));
    }
  }
}
