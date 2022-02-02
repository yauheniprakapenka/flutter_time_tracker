import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/features/passcode/models/passcode.dart';
import '../../../ui/features/passcode/models/passcode_flow.dart';
import 'app_state.dart';
import 'events/i_app_state_event.dart';

class AppStateBloc extends Bloc<IAppStateEvent, AppState> {
  AppStateBloc()
      : super(AppState(
          passcode: Passcode(),
          passcodeFlow: PasscodeFlow.getPasscodeFromStorageEvent,
        ));

  @override
  Stream<AppState> mapEventToState(IAppStateEvent event) async* {
    //
  }
}
