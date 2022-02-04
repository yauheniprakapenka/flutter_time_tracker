import '../interface/i_number_panel_event.dart';

class PasscodeButtonPressedEvent implements INumberPanelEvent {
  /// The user pressed on some passcode button.
  final String pressedValue;

  const PasscodeButtonPressedEvent({required this.pressedValue});
}
