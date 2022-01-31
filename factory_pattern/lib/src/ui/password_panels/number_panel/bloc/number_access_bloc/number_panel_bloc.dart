import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/config/i_password_panel_config.dart';
import '../../../../../app/services/ui_service_locator.dart';
import 'events/events.dart';
import 'number_panel_state.dart';

class NumberPanelBloc extends Bloc<INumberPanelEvent, NumberPanelState> {
  final _passcodeRepository =
      DataServiceLocator.instance.get<IPasscodeRepository>();
  final _passwordLength =
      UIServiceLocator.instance.get<IPasswordPanelConfig>().passwordLength;
  String _enteredPassword = '';

  NumberPanelBloc() : super(const NumberPanelState(currentPassword: ''));

  @override
  Stream<NumberPanelState> mapEventToState(INumberPanelEvent event) async* {
    if (event is PasswordButtonPressedEvent) {
      _enteredPassword += event.pressedValue;
      final enteredPasswordLength = _enteredPassword.length;
      if (enteredPasswordLength >= _passwordLength) {
        // debugPrint('Maximum length exceeded');
        final checkPasscodeHasMatchUseCase = CheckPasscodeHasMatchUseCase(
            passcodeRepository: _passcodeRepository);
        final didPasswordMatch = await checkPasscodeHasMatchUseCase(
          _enteredPassword,
        );
        debugPrint('Did password has match: $didPasswordMatch');
        _enteredPassword = '';
        yield state.copyWith(currentPassword: _enteredPassword);
        return;
      }
      // debugPrint('Old password: $_enteredPassword');

      // debugPrint('New password: $_enteredPassword');
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
