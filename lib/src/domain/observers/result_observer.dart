import 'dart:async';

import '../../domain/entities/entities.dart';

class ResultObserver {
  final controller = StreamController<Result>();

  void dispose() {
    controller.close();
  }
}
