import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../passcode.dart';
import 'events/events.dart';
import 'events/i_passcode_event.dart';
import 'passcode_state.dart';

class PasscodeBloc extends Bloc<IPasscodeEvent, PasscodeState> {
  PasscodeBloc()
      : super(const PasscodeState(
          passcodeResult: PasscodeResult.passcodeEntry,
          // passcodeFlow: PasscodeFlow.gettingPasscodeFromStorage,
        ));

  @override
  Stream<PasscodeState> mapEventToState(IPasscodeEvent event) async* {
    // if (event is GettingPasscodeFromStorageEvent) {
    //   final passcodeRepository = DataServiceLocator.instance.get<IPasscodeRepository>();
    //   final isPasscodeExistUseCase = await IsPasscodeExistUseCase(passcodeRepository: passcodeRepository).call();
    //   yield isPasscodeExistUseCase 
    //     ? state.copyWith(passcodeFlow: PasscodeFlow.launchAppWithExistingPasscode)
    //     : state.copyWith(passcodeFlow: PasscodeFlow.createNewPasscode);
    //   return;  
    // }

    if (event is CheckPasscodeEvent) {
      final _passcodeLengthLimit = UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength;
      if (event.currentEnteredPasscode.length >= _passcodeLengthLimit) {
        final passcodeRepository = DataServiceLocator.instance.get<IPasscodeRepository>();
        final checkPasscodeHasMatchUseCase = PasscodeHasMatchUseCase(passcodeRepository: passcodeRepository);
        final didPasscodeMatch = await checkPasscodeHasMatchUseCase(event.currentEnteredPasscode);
        debugPrint('Passcode has match: $didPasscodeMatch');
        yield didPasscodeMatch
          ? state.copyWith(passcodeResult: PasscodeResult.success, currentEnteredPasscode: event.currentEnteredPasscode)
          : state.copyWith(passcodeResult: PasscodeResult.fail, currentEnteredPasscode: event.currentEnteredPasscode);
        return; 
      }
      yield state.copyWith(passcodeResult: PasscodeResult.passcodeEntry, currentEnteredPasscode: event.currentEnteredPasscode);
      return;  
    }

    // if (event is ClearPasscodeStateEvent) {
    //   yield state.copyWith(passcodeResult: PasscodeResult.passcodeEntry);
    //   return;
    // }
  }
}
