import 'package:get_it/get_it.dart';

import '../../ui/shared/theme/colors/i_color.dart';

class ColorServiceLocator {
  static final instance = ColorServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void register(IColor color) {
    if (!_getIt.isRegistered<IColor>()) {
      _getIt.registerLazySingleton<IColor>(() => color);
    }
  }
}
