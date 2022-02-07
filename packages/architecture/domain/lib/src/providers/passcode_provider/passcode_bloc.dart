import 'package:data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain.dart';
import '../../use_cases/passcode_use_cases/passcode_matches_with_storage_use_case.dart';
import 'events/interface/i_passcode_event.dart';

class PasscodeBloc extends Bloc<IPasscodeEvent, PasscodeState> {
  var _passcode = const Passcode();
  final _passcodeLengthLimit = GetIt.I.get<PasscodeConfig>().passcodeLength;
  final _resultObserver = ResultServiceLocator.instance.get<ResultObserver>();

  PasscodeBloc(PasscodeFlow passcodeFlow) : super(passcodeFlow.get()) {
    PasscodeRepositoryServiceLocator.instance.register();
  }

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
          if (passcodeMatchesWithStorage) {
            _resultObserver.controller.add(Result(passcodeResult: PasscodeResult.matches, description: PasscodeResult.matches.getDescription()));
            yield state.copyWith(passcodeResult: PasscodeResult.matches);
          } else {
            _resultObserver.controller.add(Result(passcodeResult: PasscodeResult.notMatches, description: PasscodeResult.notMatches.getDescription()));
            yield state.copyWith(passcodeResult: PasscodeResult.notMatches);
          }
        }
        return;
      }

      if (state.passcodeFlow == PasscodeFlow.createPasscode) {
        _passcode = _passcode.copyWith(tempEnteredPasscode: event.enteredPasscode);
        final enteredPasscodeLength = _passcode.tempEnteredPasscode.length;
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        if (enteredPasscodeLength == _passcodeLengthLimit) {
          await _makePauseWhenEnteringMaxPasscodeLength();
          if (_passcode.createdPasscode == _passcode.tempEnteredPasscode) {
            _resultObserver.controller.add(Result(passcodeResult: PasscodeResult.matches, description: PasscodeResult.matches.getDescription()));
            final _passcodeRepository = GetIt.I.get<IPasscodeRepository>();
            await _passcodeRepository.createPasscode(_passcode.createdPasscode);
            yield state.copyWith(passcodeResult: PasscodeResult.matches);
          } else {
            yield state.copyWith(passcodeResult: PasscodeResult.notMatches);
          }
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
          if (passcodeMatchesWithStorage) {
            yield state.copyWith(passcodeResult: PasscodeResult.matches, passcodeUseCase: PasscodeUseCase.createPasscode);
          } else {
            _resultObserver.controller.add(Result(passcodeResult: PasscodeResult.notMatches, description: PasscodeResult.notMatches.getDescription()));
            yield state.copyWith(passcodeResult: PasscodeResult.notMatches);
          }
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
    final passcodeRepository = PasscodeRepositoryServiceLocator.instance.get<IPasscodeRepository>();
    final passcodeMatchesWithStorageUseCase = PasscodeMatchesWithStorageUseCase(passcodeRepository: passcodeRepository);
    return passcodeMatchesWithStorageUseCase(enteredPasscode);
  }
}
