import 'package:get_it/get_it.dart';

import '../theme/size/apps/shell_app_size_impl.dart';
import '../theme/size/interface/i_app_size.dart';
import '../theme/themes/apps/shell_app_theme_impl.dart';
import '../theme/themes/interface/i_app_theme.dart';

class UIServiceLocator {
  static final instance = UIServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void initialize() {
    _getIt
      ..registerLazySingleton<IAppSize>(ShellAppSizeImpl.new)
      ..registerLazySingleton<IAppTheme>(ShellAppThemeImpl.new);
  }
}
