import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../ui/features/passcode/widgets/logo.dart';

class LogoServiceLocator {
  static final instance = LogoServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void register(Widget? logo) {
    if (!_getIt.isRegistered<Logo>()) {
      _getIt.registerLazySingleton<Logo>(() => Logo(child: logo));
    }
  }
}
