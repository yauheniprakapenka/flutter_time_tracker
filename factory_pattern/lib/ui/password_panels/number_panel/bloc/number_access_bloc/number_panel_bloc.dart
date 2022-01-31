import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/config/i_password_panel_config.dart';
import '../../../../../app/services/service_locator.dart';
import 'events/events.dart';
import 'number_panel_state.dart';

class NumberPanelBloc extends Bloc<INumberPanelEvent, NumberPanelState> {
  String _enteredPassword = '';

  NumberPanelBloc() : super(const NumberPanelState(currentPassword: ''));

  @override
  Stream<NumberPanelState> mapEventToState(INumberPanelEvent event) async* {
    if (event is PasswordButtonPressedEvent) {
      final enteredPasswordLength = _enteredPassword.length;
      final passwordLength =
          ServiceLocator.instance.get<IPasswordPanelConfig>().passwordLength;
      if (enteredPasswordLength >= passwordLength) {
        debugPrint('Maximum length exceeded');
        return;
      }
      debugPrint('Old password: $_enteredPassword');
      _enteredPassword += event.pressedValue;
      debugPrint('New password: $_enteredPassword');
      yield state.copyWith(currentPassword: _enteredPassword);
      return;
    }

    if (event is DeleteButtonPressedEvent) {
      final enteredPasswordLength = _enteredPassword.length;
      debugPrint('Entered password: $_enteredPassword');
      if (enteredPasswordLength == 0) return;
      final newEnteredPassword =
          _enteredPassword.substring(0, enteredPasswordLength - 1);
      _enteredPassword = newEnteredPassword;
      debugPrint('New entered password: $_enteredPassword');
      yield state.copyWith(currentPassword: _enteredPassword);
      return;
    }
  }
}
