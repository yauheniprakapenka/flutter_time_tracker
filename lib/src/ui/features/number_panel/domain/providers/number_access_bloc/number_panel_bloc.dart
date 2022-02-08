import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../app/config/number_panel_config.dart';
import 'events/events.dart';
import 'number_panel_state.dart';

class NumberPanelBloc extends Bloc<INumberPanelEvent, NumberPanelState> {
  static const _emptyPasscode = '';
  String _enteredPasscode = _emptyPasscode;

  NumberPanelBloc() : super(const NumberPanelState(currentEnteredPasscode: _emptyPasscode));

  @override
  Stream<NumberPanelState> mapEventToState(INumberPanelEvent event) async* {
    if (event is PasscodeButtonPressedEvent) {
      _enteredPasscode += event.pressedValue;
      final enteredPasscodeLength = _enteredPasscode.length;
      final passcodeLength = GetIt.instance
          .get<NumberPanelConfig>()
          .passcodeLength; // UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength;
      if (enteredPasscodeLength >= passcodeLength) {
        yield state.copyWith(currentEnteredPasscode: _enteredPasscode); // Fill all indicators
        await Future.delayed(
            const Duration(milliseconds: 150)); // How many times show filled all indicators
        _clearEnteredCode();
        return;
      }
      yield state.copyWith(currentEnteredPasscode: _enteredPasscode);
      return;
    }

    if (event is DeleteButtonPressedEvent) {
      final enteredPasscodeLength = _enteredPasscode.length;
      if (enteredPasscodeLength == 0) return;
      final newEnteredPasscode = _enteredPasscode.substring(0, enteredPasscodeLength - 1);
      _enteredPasscode = newEnteredPasscode;
      yield state.copyWith(currentEnteredPasscode: _enteredPasscode);
      return;
    }

    if (event is ClearNumberPanelStateEvent) {
      _clearEnteredCode();
      yield state.copyWith(currentEnteredPasscode: _emptyPasscode);
      return;
    }
  }

  void _clearEnteredCode() {
    _enteredPasscode = _emptyPasscode;
  }
}
