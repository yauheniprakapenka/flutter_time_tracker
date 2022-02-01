import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passcode/passcode.dart';

import 'events/events.dart';
import 'number_panel_state.dart';

class NumberPanelBloc extends Bloc<INumberPanelEvent, NumberPanelState> {
  static const _emptyPassword = '';
  String _enteredPassword = _emptyPassword;

  NumberPanelBloc() : super(const NumberPanelState(currentPassword: _emptyPassword));

  @override
  Stream<NumberPanelState> mapEventToState(INumberPanelEvent event) async* {
    if (event is PasswordButtonPressedEvent) {
      _enteredPassword += event.pressedValue;
      final enteredPasswordLength = _enteredPassword.length;
      final _passwordLengthLimit = UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength;
      if (enteredPasswordLength >= _passwordLengthLimit) {
        final _passcodeRepository = DataServiceLocator.instance.get<IPasscodeRepository>();
        final checkPasscodeHasMatchUseCase = CheckPasscodeHasMatchUseCase(passcodeRepository: _passcodeRepository);
        yield state.copyWith(currentPassword: _enteredPassword); // Fill all indicators
        await Future.delayed(const Duration(milliseconds: 150)); // How many times show filled all indicators
        final didPasswordMatch = await checkPasscodeHasMatchUseCase(_enteredPassword);
        debugPrint('Did password has match: $didPasswordMatch');
        yield didPasswordMatch 
          ? state.copyWith(currentPassword: _enteredPassword, passcodeResult: PasscodeResult.success)
          : state.copyWith(currentPassword: _enteredPassword, passcodeResult: PasscodeResult.fail);
        _clearEnteredPassword();
        return;
      }
      yield state.copyWith(currentPassword: _enteredPassword);
      return;
    }

    if (event is DeleteButtonPressedEvent) {
      final enteredPasswordLength = _enteredPassword.length;
      if (enteredPasswordLength == 0) return;
      final newEnteredPassword = _enteredPassword.substring(0, enteredPasswordLength - 1);
      _enteredPassword = newEnteredPassword;
      yield state.copyWith(currentPassword: _enteredPassword);
      return;
    }
  }

  void _clearEnteredPassword() {
    _enteredPassword = _emptyPassword;
  }
}
