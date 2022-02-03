import '../interface/i_passcode_event.dart';

class EnterRepeatPasscodeEvent implements IPasscodeEvent {
  /// Содержит весь текущий введенный ключ доступа, например, '821'.
  final String enteredPasscode;

  /// Сценарий: Придумайте ключ доступа
  EnterRepeatPasscodeEvent(this.enteredPasscode);
}
