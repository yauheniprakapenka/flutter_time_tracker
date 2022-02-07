import 'package:get_it/get_it.dart';

import '../../ui/shared/theme/colors/i_app_color.dart';
import '../../ui/shared/theme/colors/shell_app_color_impl.dart';

class AppColorServiceLocator {
  static final instance = AppColorServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void register() {
    _getIt.registerLazySingleton<IAppColor>(ShellAppColorImpl.new);
  }
}
