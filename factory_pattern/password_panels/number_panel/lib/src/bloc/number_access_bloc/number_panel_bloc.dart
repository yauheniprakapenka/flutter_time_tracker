import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passcode/passcode.dart';

import 'events/events.dart';
import 'number_panel_state.dart';

class NumberPanelBloc extends Bloc<INumberPanelEvent, NumberPanelState> {
  static const _emptyPasscode = '';
  String _enteredCode = _emptyPasscode;

  NumberPanelBloc() : super(const NumberPanelState(currentPasscode: _emptyPasscode));

  @override
  Stream<NumberPanelState> mapEventToState(INumberPanelEvent event) async* {
    if (event is PasscodeButtonPressedEvent) {
      _enteredCode += event.pressedValue;
      final enteredPasscodeLength = _enteredCode.length;
      final _passcodeLengthLimit = UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength;
      if (enteredPasscodeLength >= _passcodeLengthLimit) {
        final _passcodeRepository = DataServiceLocator.instance.get<IPasscodeRepository>();
        final checkPasscodeHasMatchUseCase = CheckPasscodeHasMatchUseCase(passcodeRepository: _passcodeRepository);
        yield state.copyWith(currentPasscode: _enteredCode); // Fill all indicators
        await Future.delayed(const Duration(milliseconds: 150)); // How many times show filled all indicators
        final didPasscodeMatch = await checkPasscodeHasMatchUseCase(_enteredCode);
        debugPrint('Did passcode has match: $didPasscodeMatch');
        yield didPasscodeMatch 
          ? state.copyWith(currentPasscode: _enteredCode, passcodeResult: PasscodeResult.success)
          : state.copyWith(currentPasscode: _enteredCode, passcodeResult: PasscodeResult.fail);
        _clearEnteredCode();
        return;
      }
      yield state.copyWith(currentPasscode: _enteredCode);
      return;
    }

    if (event is DeleteButtonPressedEvent) {
      final enteredPasscodeLength = _enteredCode.length;
      if (enteredPasscodeLength == 0) return;
      final newEnteredPasscode = _enteredCode.substring(0, enteredPasscodeLength - 1);
      _enteredCode = newEnteredPasscode;
      yield state.copyWith(currentPasscode: _enteredCode);
      return;
    }
  }

  void _clearEnteredCode() {
    _enteredCode = _emptyPasscode;
  }
}
