import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../passcode.dart';
import '../../models/passcode.dart';
import '../../models/passcode_flow.dart';
import '../../models/passcode_use_case.dart';
import 'events/events.dart';
import 'events/interface/i_passcode_event.dart';
import 'passcode_state.dart';

class PasscodeBloc extends Bloc<IPasscodeEvent, PasscodeState> {
  var _passcode = const Passcode();
  final _passcodeLengthLimit = UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength;

  PasscodeBloc()
      : super(
          const PasscodeState(
            passcodeFlow: PasscodeFlow.createPasscode,
            passcodeUseCase: PasscodeUseCase.createPasscode,

            // passcodeFlow: PasscodeFlow.changePasscode,
            // passcodeUseCase: PasscodeUseCase.enterCurrentPasscode,

            // passcodeFlow: PasscodeFlow.loginWithPasscode,
            // passcodeUseCase: PasscodeUseCase.enterCurrentPasscode,
          ),
        );

  @override
  Stream<PasscodeState> mapEventToState(IPasscodeEvent event) async* {
    if (event is EnterNewPasscodeEvent) {
      _passcode = _passcode.copyWith(createdPasscode: event.enteredPasscode);
      final createdPasscodeLength = _passcode.createdPasscode.length;
      yield state.copyWith(passcodeUseCase: PasscodeUseCase.createPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
      if (createdPasscodeLength == _passcodeLengthLimit) {
        await _makePauseWhenEnteringMaxPasscodeLength();
        _clearTempEnteredPasscode();
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcode: _passcode, passcodeFlow: PasscodeFlow.createPasscode);
      }
      return;
    }

    if (event is CheckEnteredPasscodeWithExistEvent) {
      if (state.passcodeFlow == PasscodeFlow.loginWithPasscode) {
        _passcode = _passcode.copyWith(tempEnteredPasscode: event.enteredPasscode);
        final enteredPasscodeLength = _passcode.tempEnteredPasscode.length;
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        if (enteredPasscodeLength == _passcodeLengthLimit) {
          await _makePauseWhenEnteringMaxPasscodeLength();
          final passcodeMatchesWithStorage = await _userPasscodeMatchesWithStorage(event.enteredPasscode);
          yield passcodeMatchesWithStorage
              ? state.copyWith(passcodeResult: PasscodeResult.passcodeMatches)
              : state.copyWith(passcodeResult: PasscodeResult.passcodeNotMatches);
        }
        return;
      }

      if (state.passcodeFlow == PasscodeFlow.createPasscode) {
        _passcode = _passcode.copyWith(tempEnteredPasscode: event.enteredPasscode);
        final enteredPasscodeLength = _passcode.tempEnteredPasscode.length;
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        if (enteredPasscodeLength == _passcodeLengthLimit) {
          await _makePauseWhenEnteringMaxPasscodeLength();
          yield _passcode.createdPasscode == _passcode.tempEnteredPasscode
              ? state.copyWith(passcodeResult: PasscodeResult.passcodeMatches)
              : state.copyWith(passcodeResult: PasscodeResult.passcodeNotMatches);
        }
        return;
      }

      if (state.passcodeFlow == PasscodeFlow.changePasscode) {
        _passcode = _passcode.copyWith(tempEnteredPasscode: event.enteredPasscode);
        final enteredPasscodeLength = _passcode.tempEnteredPasscode.length;
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        if (enteredPasscodeLength == _passcodeLengthLimit) {
          await _makePauseWhenEnteringMaxPasscodeLength();
          final passcodeMatchesWithStorage = await _userPasscodeMatchesWithStorage(event.enteredPasscode);
          yield passcodeMatchesWithStorage
              ? state.copyWith(passcodeResult: PasscodeResult.passcodeMatches, passcodeUseCase: PasscodeUseCase.createPasscode)
              : state.copyWith(passcodeResult: PasscodeResult.passcodeNotMatches);
        }
        return;
      }
    }
  }

  /// Пауза для визуального восприятия, что закрашены все индикаторы
  Future<void> _makePauseWhenEnteringMaxPasscodeLength() async {
    await Future.delayed(const Duration(milliseconds: 140));
  }

  void _clearTempEnteredPasscode() {
    _passcode = _passcode.copyWith(tempEnteredPasscode: '');
  }

  Future<bool> _userPasscodeMatchesWithStorage(String enteredPasscode) async {
    final passcodeRepository = DataServiceLocator.instance.get<IPasscodeRepository>();
    final passcodeMatchesWithStorageUseCase = PasscodeMatchesWithStorageUseCase(passcodeRepository: passcodeRepository);
    return passcodeMatchesWithStorageUseCase(enteredPasscode);
  }
}
