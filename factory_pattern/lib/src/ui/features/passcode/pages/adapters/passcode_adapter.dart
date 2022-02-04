import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../../../../passcode.dart';
import '../../../../../app/bloc/passcode_bloc/events/events/enter_created_passcode_event.dart';
import '../../../../../app/bloc/passcode_bloc/passcode_bloc.dart';
import '../../../../../app/bloc/passcode_bloc/passcode_state.dart';
import '../../widgets/passcode_indicator.dart';

class PasscodeAdapter extends StatelessWidget {
  const PasscodeAdapter({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocConsumer<NumberPanelBloc, NumberPanelState>(
      listener: (context, numberPanelState) {
        BlocProvider.of<PasscodeBloc>(context).add(EnterCreatedPasscodeEvent(numberPanelState.currentEnteredPasscode));
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
