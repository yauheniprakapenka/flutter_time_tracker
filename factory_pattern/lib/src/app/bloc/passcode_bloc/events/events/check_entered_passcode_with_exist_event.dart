import '../interface/i_passcode_event.dart';

class CheckEnteredPasscodeWithExistEvent implements IPasscodeEvent {
  final String enteredPasscode;

  CheckEnteredPasscodeWithExistEvent(this.enteredPasscode);
}
