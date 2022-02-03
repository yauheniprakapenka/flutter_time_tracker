import '../interface/i_passcode_event.dart';

class CheckThisPasscodeWithExistEvent implements IPasscodeEvent {
  final String enteredPasscode;

  CheckThisPasscodeWithExistEvent(this.enteredPasscode);
}
