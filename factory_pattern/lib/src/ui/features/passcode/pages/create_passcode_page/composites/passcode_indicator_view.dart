import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../../../../../passcode.dart';
import '../../../../../../app/bloc/passcode_bloc/events/events.dart';
import '../../../../../../app/bloc/passcode_bloc/passcode_bloc.dart';
import '../../../../../../app/bloc/passcode_bloc/passcode_state.dart';
import '../../../widgets/passcode_indicator.dart';

class PasscodeIndicatorView extends StatelessWidget {
  const PasscodeIndicatorView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocConsumer<NumberPanelBloc, NumberPanelState>(
      listener: (context, numberPanelState) {
        BlocProvider.of<PasscodeBloc>(context).add(EnterCreatePasscodeEvent(numberPanelState.currentEnteredPasscode));
      },
      builder: (context, numberPanelState) {
        return BlocBuilder<PasscodeBloc, PasscodeState>(
          builder: (context, passcodeState) {
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
