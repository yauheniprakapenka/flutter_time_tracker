import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../../app/bloc/passcode_bloc/events/events/enter_new_passcode_event.dart';
import '../../../../app/bloc/passcode_bloc/passcode_bloc.dart';
import '../../../../app/bloc/passcode_bloc/passcode_state.dart';
import '../../../../app/config/i_passcode_config.dart';
import '../../../../app/services/ui_service_locator.dart';
import '../widgets/passcode_indicator.dart';

class PasscodeAdapter extends StatelessWidget {
  const PasscodeAdapter({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocConsumer<NumberPanelBloc, NumberPanelState>(
      listener: (context, numberPanelState) {
        BlocProvider.of<PasscodeBloc>(context).add(EnterNewPasscodeEvent(numberPanelState.currentEnteredPasscode));
      },
      builder: (context, numberPanelState) {
        return BlocBuilder<PasscodeBloc, PasscodeState>(
          builder: (context, passcodeState) {
            debugPrint(passcodeState.passcode.toString());
            return PasscodeIndicator(
              indicatorLength: UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength,
              activeIndicatorLength: passcodeState.passcode.createdPasscode.length,
              passcodeResult: passcodeState.passcodeResult,
            );
          },
        );
      },
    );
  }
}
