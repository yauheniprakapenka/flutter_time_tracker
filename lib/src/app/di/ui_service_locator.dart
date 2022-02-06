import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

import '../../ui/shared/localization/i_localization.dart';
import '../../ui/shared/localization/shell_localization_impl.dart';
import '../../ui/shared/theme/colors/i_app_color.dart';
import '../../ui/shared/theme/colors/shell_app_color_impl.dart';
import '../config/shell_passcode_config_impl.dart';

class UIServiceLocator {
  static final instance = UIServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void init() {
    _getIt
      ..registerLazySingleton<IAppColor>(ShellAppColorImpl.new)
      ..registerLazySingleton<IPasscodeConfig>(ShellPasscodeConfigImpl.new)
      ..registerLazySingleton<ILocalization>(ShellLocalizationImpl.new);
  }
}
