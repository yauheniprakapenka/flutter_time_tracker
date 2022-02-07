import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

class PasscodeServiceLocator {
  static final instance = PasscodeServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void register(int passcodeLength) {
    if (!_getIt.isRegistered<PasscodeConfig>()) {
      _getIt.registerLazySingleton<PasscodeConfig>(() => PasscodeConfig(passcodeLength: passcodeLength));
    }
  }
}
