import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/features/passcode/models/passcode.dart';
import '../../../ui/features/passcode/models/passcode_flow.dart';
import 'events/events.dart';
import 'events/i_app_state_event.dart';
import 'passcode_state.dart';

class PasscodeBloc extends Bloc<IPasscodeStateEvent, PasscodeState> {
  static const _emptyPasscode = '';

  PasscodeBloc()
      : super(PasscodeState(
          passcode: Passcode(),
          passcodeFlow: PasscodeFlow.gettingPasscodeFromStorage,
        ));

  @override
  Stream<PasscodeState> mapEventToState(IPasscodeStateEvent event) async* {
    if (event is GettingPasscodeFromStorageEvent) {
      final passcodeRepository = DataServiceLocator.instance.get<IPasscodeRepository>();
      final isPasscodeExistUseCase = await IsPasscodeExistUseCase(passcodeRepository: passcodeRepository).call();
      yield isPasscodeExistUseCase 
        ? state.copyWith(passcodeFlow: PasscodeFlow.launchAppWithExistingPasscode)
        : state.copyWith(passcodeFlow: PasscodeFlow.createNewPasscode);
      return;  
    }
  }
}
