import '../interface/i_passcode_event.dart';

class EnterCreatedPasscodeEvent implements IPasscodeEvent {
  /// Содержит весь текущий введенный ключ доступа, например, '821'.
  final String enteredPasscode;

  /// Сценарий: Придумайте ключ доступа
  EnterCreatedPasscodeEvent(this.enteredPasscode);
}
