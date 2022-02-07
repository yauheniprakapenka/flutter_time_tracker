import 'dart:async';

/// Наблюдает за нажатием кнопки «Отмена» на всех экранах ввода 
/// ключа доступа, созданных с `PasscodePageBuilder`.
class CancelButtonObserver {
  /// Переданный строковый параметр ни на что не влияет.
  /// Можно передавать какую-то информацию, например, на каком экране нажато.
  final controller = StreamController<String>();

  void dispose() {
    controller.close();
  }
}
