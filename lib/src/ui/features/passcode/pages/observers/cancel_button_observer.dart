import 'dart:async';

/// Наблюдает за нажатием кнопки «Отмена» на всех экранах ввода 
/// ключа доступа, созданных с `PasscodePageBuilder`.
class CancelButtonObserver {
  /// Переданный строковый параметр ни на что не влияет.
  /// Передается в качестве информации.
  final controller = StreamController<String>();

  void dispose() {
    controller.close();
  }
}
