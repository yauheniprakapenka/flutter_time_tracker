import 'package:get_it/get_it.dart';
import '../config/i_password_panel_config.dart';
import '../config/shell_password_config_impl.dart';

import '../theme/colors/i_app_color.dart';
import '../theme/colors/shell_app_color_impl.dart';
import '../theme/sizes/i_app_size.dart';
import '../theme/sizes/shell_app_size_impl.dart';

class UIServiceLocator {
  static final instance = UIServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void init() {
    _getIt
      ..registerLazySingleton<IAppColor>(ShellAppColorImpl.new)
      ..registerLazySingleton<IAppSize>(ShellAppSizeImpl.new)
      ..registerLazySingleton<IPasswordPanelConfig>(ShellPasswordConfigImpl.new);
  }
}
