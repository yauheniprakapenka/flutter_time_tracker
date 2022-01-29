import 'package:get_it/get_it.dart';

import '../theme/colors/apps/shell_app_color_impl.dart';
import '../theme/colors/interface/i_app_color.dart';
import '../theme/sizes/apps/shell_app_size_impl.dart';
import '../theme/sizes/interface/i_app_size.dart';

class UIServiceLocator {
  static final instance = UIServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void initialize() {
    _getIt
      ..registerLazySingleton<IAppSize>(ShellAppSizeImpl.new)
      ..registerLazySingleton<IAppColor>(ShellAppColorImpl.new);
  }
}
