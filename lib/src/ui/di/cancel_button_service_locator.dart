import 'package:get_it/get_it.dart';

import '../../ui/features/passcode/pages/observers/cancel_button_observer.dart';

class CancelButtonServiceLocator {
  static final instance = CancelButtonServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void register() {
    if (!_getIt.isRegistered<CancelButtonObserver>()) {
      _getIt.registerLazySingleton<CancelButtonObserver>(CancelButtonObserver.new);
    }
  }

  void dispose() {
    _getIt.get<CancelButtonObserver>().dispose();
    _getIt.unregister<CancelButtonObserver>();
  }
}
