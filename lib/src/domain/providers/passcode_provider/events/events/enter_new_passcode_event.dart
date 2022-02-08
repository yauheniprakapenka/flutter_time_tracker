import '../interface/i_passcode_event.dart';

/// Сценарий: Придумайте ключ доступа
class EnterNewPasscodeEvent implements IPasscodeEvent {
  /// Содержит весь текущий введенный ключ доступа, например, '821'.
  final String enteredPasscode;

  EnterNewPasscodeEvent(this.enteredPasscode);
}
