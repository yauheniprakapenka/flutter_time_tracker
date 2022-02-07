import 'package:get_it/get_it.dart';

import '../../domain.dart';

class ResultServiceLocator {
  static final instance = ResultServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void register() {
    if (!_getIt.isRegistered<ResultObserver>()) {
      _getIt.registerLazySingleton(ResultObserver.new);
    }
  }

  void dispose() {
    _getIt.get<ResultObserver>().dispose();
    _getIt.unregister<ResultObserver>();
  }
}
