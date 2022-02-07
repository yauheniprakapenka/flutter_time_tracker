import 'dart:async';

import '../entities/entities.dart';

class ResultObserver {
  final controller = StreamController<Result>();

  void dispose() {
    controller.close();
  }
}
