import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../../../passcode.dart';
import '../../../../app/bloc/passcode_bloc/events/check_passcode_event.dart';
import '../../../../app/bloc/passcode_bloc/events/events.dart';
import '../../../../app/bloc/passcode_bloc/passcode_bloc.dart';
import '../../../../app/bloc/passcode_bloc/passcode_state.dart';
import '../decorators/animation_width_decorator.dart';
import '../widgets/passcode_indicator.dart';

class PasscodeIndicatorView extends StatefulWidget {
  const PasscodeIndicatorView({Key? key}) : super(key: key);

  @override
  State<PasscodeIndicatorView> createState() => _PasscodeIndicatorViewState();
}

class _PasscodeIndicatorViewState extends State<PasscodeIndicatorView> with TickerProviderStateMixin {
  static const animationDuration = Duration(milliseconds: 50);
  static const maxAnimationRepeat = 2;
  var animationRepeatCounter = 0;

  late final leftWidthCntrl = AnimationController(duration: animationDuration, vsync: this);
  late final rightWidthCntrl = AnimationController(duration: animationDuration, vsync: this);

  @override
  void dispose() {
    leftWidthCntrl.dispose();
    rightWidthCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return BlocConsumer<NumberPanelBloc, NumberPanelState>(listener: (context, numberPanelState) {
      BlocProvider.of<PasscodeBloc>(context).add(CheckPasscodeEvent(numberPanelState.currentEnteredPasscode));
    }, builder: (context, numberPanelState) {
      return BlocBuilder<PasscodeBloc, PasscodeState>(
        builder: (context, passcodeState) {
          if (passcodeState.passcodeResult == PasscodeResult.fail) {
            _playWrongPasscodeAnimation().whenComplete(() {
              context.read<NumberPanelBloc>().add(ClearNumberPanelStateEvent());
            });
          }

          return AnimationWidthDecorator(
            leftWidthCntrl: leftWidthCntrl,
            rightWidthCntrl: rightWidthCntrl,
            child: PasscodeIndicator(
              indicatorLength: UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength,
              activeIndicatorLength: passcodeState.currentEnteredPasscode.length,
              passcodeResult: passcodeState.passcodeResult,
            ),
          );
        },
      );
    });
  }

  Future<void> _playWrongPasscodeAnimation() async {
    _resetCounter();
    try {
      while (animationRepeatCounter < maxAnimationRepeat) {
        await leftWidthCntrl.forward().orCancel;
        await leftWidthCntrl.reverse().orCancel;
        await rightWidthCntrl.forward().orCancel;
        await rightWidthCntrl.reverse().orCancel;
        animationRepeatCounter++;
      }
    } on Exception catch (e) {
      debugPrint('Passcode ticker exception: ${e.toString()}');
    }
  }

  void _resetCounter() {
    animationRepeatCounter = 0;
  }
}
