import 'dart:async';

import 'package:flutter/foundation.dart';

import '../entities/entities.dart';

class PasscodeFacade {
  final _stateCntrl = StreamController<Result>();
  final _eventCntrl = StreamController<Result>();

  Stream<Result> get state => _stateCntrl.stream;
  Sink<Result> get event => _eventCntrl.sink;

  PasscodeFacade() {
    _eventCntrl.stream.listen((event) {
      debugPrint('Passcode Facade: $event');
    });
  }

  void dispose() {
    _stateCntrl.close();
    _eventCntrl.close();
  }
}

// TODO(e): Сохранять в Flutter Storage
// TODO(e): Передавать длину пароля
// TODO(e): Передавать локализацию
// TODO(e): Добавить callback для кнопки отмена
// TODO(e): Перенести DataServiceLocator.instance.init();
