import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/config/i_passcode_config.dart';
import '../../../../../app/services/ui_service_locator.dart';
import '../../../../models/passcode_result.dart';
import 'events/events.dart';
import 'number_panel_state.dart';

class NumberPanelBloc extends Bloc<INumberPanelEvent, NumberPanelState> {
  String _enteredPassword = '';

  NumberPanelBloc() : super(const NumberPanelState(currentPassword: ''));

  @override
  Stream<NumberPanelState> mapEventToState(INumberPanelEvent event) async* {
    if (event is PasswordButtonPressedEvent) {
      _enteredPassword += event.pressedValue;
      final enteredPasswordLength = _enteredPassword.length;
      final _passwordLengthLimit =
          UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength;
      if (enteredPasswordLength >= _passwordLengthLimit) {
        final _passcodeRepository =
            DataServiceLocator.instance.get<IPasscodeRepository>();
        final checkPasscodeHasMatchUseCase = CheckPasscodeHasMatchUseCase(
            passcodeRepository: _passcodeRepository);
        yield state.copyWith(
            currentPassword: _enteredPassword); // Fill all indicators
        await Future.delayed(
          const Duration(milliseconds: 150),
        ); // How many times show filled all indicators
        final didPasswordMatch =
            await checkPasscodeHasMatchUseCase(_enteredPassword);
        debugPrint('Did password has match: $didPasswordMatch');
        if (didPasswordMatch) {
          yield state.copyWith(
            currentPassword: _enteredPassword,
            passcodeResult: PasscodeResult.success,
          );
        } else {
          yield state.copyWith(
            currentPassword: _enteredPassword,
            passcodeResult: PasscodeResult.fail,
          );
        }
        _enteredPassword = '';
        return;
      }
      yield state.copyWith(currentPassword: _enteredPassword);
      return;
    }

    if (event is DeleteButtonPressedEvent) {
      final enteredPasswordLength = _enteredPassword.length;
      if (enteredPasswordLength == 0) return;
      final newEnteredPassword =
          _enteredPassword.substring(0, enteredPasswordLength - 1);
      _enteredPassword = newEnteredPassword;
      yield state.copyWith(currentPassword: _enteredPassword);
      return;
    }
  }
}
