import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../passcode.dart';
import '../../../ui/features/passcode/models/passcode.dart';
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
            passcodeResult: PasscodeResult.passcodeEntry,
            passcodeFlow: PasscodeUseCase.createPasscode,
            passcode: Passcode(),
          ),
        );

  @override
  Stream<PasscodeState> mapEventToState(IPasscodeEvent event) async* {
    if (event is EnterCreatePasscodeEvent) {
      _passcode.createdPasscode = event.enteredPasscode;
      final createdPasscodeLength = _passcode.createdPasscode.length;
      if (createdPasscodeLength == _passcodeLengthLimit) {
        yield state.copyWith(passcodeFlow: PasscodeUseCase.createPasscode, passcodeResult: PasscodeResult.passcodeEntry, passcode: _passcode);
        await _makePauseAfterEnteringMaxPasscodeLength();
        yield state.copyWith(passcodeFlow: PasscodeUseCase.repeatePasscode, passcodeResult: PasscodeResult.passcodeEntry, passcode: _passcode);
        return;
      }
      yield state.copyWith(passcodeFlow: PasscodeUseCase.createPasscode, passcodeResult: PasscodeResult.passcodeEntry, passcode: _passcode);
      return;
    }

    if (event is EnterRepeatPasscodeEvent) {
      _passcode.repeatedPasscode = event.enteredPasscode;
      final repeatedPasscodeLength = _passcode.repeatedPasscode.length;
      if (repeatedPasscodeLength == _passcodeLengthLimit) {
        yield state.copyWith(passcodeFlow: PasscodeUseCase.repeatePasscode, passcodeResult: PasscodeResult.passcodeEntry, passcode: _passcode);
        await _makePauseAfterEnteringMaxPasscodeLength();
        if (_passcode.createdPasscode == _passcode.repeatedPasscode) {
          yield state.copyWith(passcodeFlow: PasscodeUseCase.repeatePasscode, passcodeResult: PasscodeResult.passcodeMatches, passcode: _passcode);
        } else {
          yield state.copyWith(passcodeFlow: PasscodeUseCase.repeatePasscode, passcodeResult: PasscodeResult.passcodeNotMatches, passcode: _passcode);
        }
        return;
      }
      yield state.copyWith(passcodeFlow: PasscodeUseCase.repeatePasscode, passcodeResult: PasscodeResult.passcodeEntry, passcode: _passcode);
      return;
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

  Future<void> _makePauseAfterEnteringMaxPasscodeLength() async {
    await Future.delayed(const Duration(milliseconds: 140));
  }
}
