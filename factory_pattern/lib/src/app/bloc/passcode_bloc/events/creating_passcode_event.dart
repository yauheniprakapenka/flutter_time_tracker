import 'i_passcode_event.dart';

class CreatingPasscodeEvent implements IPasscodeEvent {
  final String currentEnteredPasscode;

  /// Сценарий: Придумайте ключ доступа
  CreatingPasscodeEvent(this.currentEnteredPasscode);
}
