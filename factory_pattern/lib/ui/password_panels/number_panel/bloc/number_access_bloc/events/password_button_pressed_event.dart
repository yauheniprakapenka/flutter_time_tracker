import 'i_number_panel_event.dart';

class PasswordButtonPressedEvent implements INumberPanelEvent {
  /// The user pressed on some password button.
  final String pressedValue;

  const PasswordButtonPressedEvent({required this.pressedValue});
}
