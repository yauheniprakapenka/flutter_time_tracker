import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../passcode.dart';
import '../../../ui/features/passcode/models/passcode.dart';
import '../../../ui/features/passcode/models/passcode_flow.dart';
import '../../../ui/features/passcode/models/passcode_use_case.dart';
import 'events/events.dart';
import 'events/interface/i_passcode_event.dart';
import 'passcode_state.dart';

// TODO попробовать передавать не всю модель Passcode, а только нужную строку с кодом

class PasscodeBloc extends Bloc<IPasscodeEvent, PasscodeState> {
  final _passcode = Passcode();
  final _passcodeLengthLimit = UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength;

  PasscodeBloc()
      : super(
          PasscodeState(
            passcodeFlow: PasscodeFlow.changePasscode,
            passcodeResult: PasscodeResult.passcodeEntring,
            passcodeUseCase: PasscodeUseCase.enterCurrentPasscode,
            passcode: Passcode(),
          ),
        );

  @override
  Stream<PasscodeState> mapEventToState(IPasscodeEvent event) async* {
    if (event is EnterCreatePasscodeEvent) {
      _passcode.createdPasscode = event.enteredPasscode;
      final createdPasscodeLength = _passcode.createdPasscode.length;
      if (createdPasscodeLength == _passcodeLengthLimit) {
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.createPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        await _makePauseWhenEnteringMaxPasscodeLength();
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        return;
      }
      yield state.copyWith(passcodeUseCase: PasscodeUseCase.createPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
      return;
    }

    if (event is CheckThisPasscodeWithExistEvent) {
      if (state.passcodeFlow == PasscodeFlow.changePasscode) {
        _passcode.enteredPasscode = event.enteredPasscode;
        final repeatedPasscodeLength = _passcode.enteredPasscode.length;
        if (repeatedPasscodeLength == _passcodeLengthLimit) {
          yield state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
          await _makePauseWhenEnteringMaxPasscodeLength();
          final passcodeRepository = DataServiceLocator.instance.get<IPasscodeRepository>();
          final checkPasscodeHasMatchUseCase = PasscodeHasMatchUseCase(passcodeRepository: passcodeRepository);
          final didPasscodeMatch = await checkPasscodeHasMatchUseCase(event.enteredPasscode);
          yield didPasscodeMatch
              ? state.copyWith(passcodeUseCase: PasscodeUseCase.createPasscode, passcodeResult: PasscodeResult.passcodeMatches, passcode: _passcode)
              : state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeNotMatches, passcode: _passcode);
          return;
        }
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.enterCurrentPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        return;
      }

      if (state.passcodeFlow == PasscodeFlow.createPasscode) {
        _passcode.enteredPasscode = event.enteredPasscode;
        final repeatedPasscodeLength = _passcode.enteredPasscode.length;
        if (repeatedPasscodeLength == _passcodeLengthLimit) {
          yield state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
          await _makePauseWhenEnteringMaxPasscodeLength();
          if (_passcode.createdPasscode == _passcode.enteredPasscode) {
            yield state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeMatches, passcode: _passcode);
          } else {
            yield state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeNotMatches, passcode: _passcode);
          }
          return;
        }
        yield state.copyWith(passcodeUseCase: PasscodeUseCase.repeatPasscode, passcodeResult: PasscodeResult.passcodeEntring, passcode: _passcode);
        return;
      }
    }

    // if (event is CheckPasscodeEvent) {
    //   if (event.currentEnteredPasscode.length >= _passcodeLengthLimit) {
    //     final passcodeRepository = DataServiceLocator.instance.get<IPasscodeRepository>();
    //     final checkPasscodeHasMatchUseCase = PasscodeHasMatchUseCase(passcodeRepository: passcodeRepository);
    //     final didPasscodeMatch = await checkPasscodeHasMatchUseCase(event.currentEnteredPasscode);
    //     debugPrint('Passcode has match: $didPasscodeMatch');
    //     yield didPasscodeMatch
    //         ? state.copyWith(passcodeResult: PasscodeResult.passcodeMatches, passcode: _passcode)
    //         : state.copyWith(passcodeResult: PasscodeResult.passcodeNotMatches, passcode: _passcode);
    //     return;
    //   }
    //   yield state.copyWith(passcodeResult: PasscodeResult.entryPasscode, passcode: _passcode);
    //   return;
    // }
  }

  Future<void> _makePauseWhenEnteringMaxPasscodeLength() async {
    await Future.delayed(const Duration(milliseconds: 140));
  }
}
