import 'package:get_it/get_it.dart';

import '../../ui/shared/localization/i_localization.dart';

class LocalizationServiceLocator {
  static final instance = LocalizationServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void register(ILocalization localization) {
    _getIt.registerLazySingleton<ILocalization>(() => localization);
  }
}
