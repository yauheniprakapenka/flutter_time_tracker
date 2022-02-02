import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../../../passcode.dart';
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
    final passcodeLength = UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength;
    return BlocBuilder<NumberPanelBloc, NumberPanelState>(
      builder: (context, state) {
        if (state.passcodeResult == PasscodeResult.fail) {
          _playWrongPasscodeAnimation().whenComplete(() {
            BlocProvider.of<NumberPanelBloc>(context).add(ClearStateEvent());
          });
        }
        return AnimationWidthDecorator(
          leftWidthCntrl: leftWidthCntrl,
          rightWidthCntrl: rightWidthCntrl,
          child: PasscodeIndicator(
            indicatorLength: passcodeLength,
            activeIndicatorLength: state.currentPasscode.length,
            passcodeResult: state.passcodeResult,
          ),
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
