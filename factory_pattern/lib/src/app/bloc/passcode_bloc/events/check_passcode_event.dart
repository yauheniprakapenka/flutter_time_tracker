import 'i_passcode_event.dart';

class CheckPasscodeEvent implements IPasscodeEvent {
  final String currentEnteredPasscode;

  CheckPasscodeEvent(this.currentEnteredPasscode);
}
