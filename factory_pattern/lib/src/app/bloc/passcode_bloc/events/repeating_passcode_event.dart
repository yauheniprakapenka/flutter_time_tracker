import 'i_passcode_event.dart';

class RepeatingPasscodeEvent implements IPasscodeEvent {
  final String currentEnteredPasscode;

  /// Сценарий: Повторите ключ доступа
  RepeatingPasscodeEvent(this.currentEnteredPasscode);
}
