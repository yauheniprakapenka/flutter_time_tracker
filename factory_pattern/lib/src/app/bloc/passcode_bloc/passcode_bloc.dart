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
  final _passcode = Passcode();
  final _passcodeLengthLimit = UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength;

  PasscodeBloc()
      : super(
          PasscodeState(
            passcodeFlow: PasscodeFlow.changePasscode,
            passcodeUseCase: PasscodeUseCase.enterCurrentPasscode,
            passcodeResult: PasscodeResult.passcodeEntring,
            passcode: Passcode(),
          ),
        );

  @override
  Stream<PasscodeState> mapEventToState(IPasscodeEvent event) async* {
    if (event is EnterNewPasscodeEvent) {
      _passcode.createdPasscode = event.enteredPasscode;
      final createdPasscodeLength = _passcode.createdPasscode.length;
      if (createdPasscodeLength == _passcodeLengthLimit) {
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.createPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        await _makePauseWhenEnteringMaxPasscodeLength();
        _clearTempEnteredPasscode();
        yield state.copyWith(passcodeFlow: PasscodeFlow.createPasscode, passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        return;
      }
      yield state.copyWith(passcodeUseCase: PasscodeUseCase.createPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
      return;
    }

    if (event is CheckEnteredPasscodeWithExistEvent) {
      if (state.passcodeFlow == PasscodeFlow.loginWithPasscode) {
        _passcode.tempEnteredPasscode = event.enteredPasscode;
        final enteredPasscodeLength = _passcode.tempEnteredPasscode.length;
        if (enteredPasscodeLength == _passcodeLengthLimit) {
          yield state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
          await _makePauseWhenEnteringMaxPasscodeLength();
          final passcodeMatchesWithStorage = await _passcodeMatchesWithStorage(event.enteredPasscode);
          yield passcodeMatchesWithStorage
              ? state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeMatches, passcode: _passcode)
              : state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeNotMatches, passcode: _passcode);
          return;
        }
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        return;
      }

      if (state.passcodeFlow == PasscodeFlow.createPasscode) {
        _passcode.tempEnteredPasscode = event.enteredPasscode;
        final enteredPasscodeLength = _passcode.tempEnteredPasscode.length;
        if (enteredPasscodeLength == _passcodeLengthLimit) {
          yield state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
          await _makePauseWhenEnteringMaxPasscodeLength();
          yield _passcode.createdPasscode == _passcode.tempEnteredPasscode
              ? state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeMatches, passcode: _passcode)
              : state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeNotMatches, passcode: _passcode);
          return;
        }
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        return;
      }

      if (state.passcodeFlow == PasscodeFlow.changePasscode) {
        _passcode.tempEnteredPasscode = event.enteredPasscode;
        final enteredPasscodeLength = _passcode.tempEnteredPasscode.length;
        if (enteredPasscodeLength == _passcodeLengthLimit) {
          yield state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
          await _makePauseWhenEnteringMaxPasscodeLength();
          final passcodeMatchesWithStorage = await _passcodeMatchesWithStorage(event.enteredPasscode);
          yield passcodeMatchesWithStorage
              ? state.copyWith(passcodeUseCase: PasscodeUseCase.createPasscode, passcodeResult: PasscodeResult.passcodeMatches, passcode: _passcode)
              : state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeNotMatches, passcode: _passcode);
          return;
        }
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        return;
      }
    }
  }

  /// Пауза для визуального восприятия, что закрашены все индикаторы
  Future<void> _makePauseWhenEnteringMaxPasscodeLength() async {
    await Future.delayed(const Duration(milliseconds: 140));
  }

  void _clearTempEnteredPasscode() {
    _passcode.tempEnteredPasscode = '';
  }

  Future<bool> _passcodeMatchesWithStorage(String enteredPasscode) async {
    final passcodeRepository = DataServiceLocator.instance.get<IPasscodeRepository>();
    final passcodeMatchesWithStorageUseCase = PasscodeMatchesWithStorageUseCase(passcodeRepository: passcodeRepository);
    return passcodeMatchesWithStorageUseCase(enteredPasscode);
  }
}
