import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../features/passcode/widgets/delete_icon.dart';

class DeleteIconServiceLocator {
  static final instance = DeleteIconServiceLocator();
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  void register(Widget child) {
    if (!_getIt.isRegistered<DeleteIcon>()) {
      _getIt.registerLazySingleton<DeleteIcon>(() => DeleteIcon(child: child));
    }
  }
}
