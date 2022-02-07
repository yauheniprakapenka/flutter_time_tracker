import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../../app/di/app_color_service_locator.dart';
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
              indicatorLength: AppColorServiceLocator.instance.get<PasscodeConfig>().passcodeLength,
              activeIndicatorLength: passcodeState.passcode.createdPasscode.length,
              passcodeResult: passcodeState.passcodeResult,
            );
          },
        );
      },
    );
  }
}
