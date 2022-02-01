import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../../passcode.dart';
import '../../widgets/widgets.dart';
import 'decorators/animation_width_decorator.dart';

class PasscodePage extends StatefulWidget {
  const PasscodePage({Key? key}) : super(key: key);

  @override
  State<PasscodePage> createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage>
    with TickerProviderStateMixin {
  static const duration = Duration(milliseconds: 50);
  static const maxAnimationRepeatCounter = 2;
  var currentAnimationRepeatCounter = 0;

  late final leftWidthCntrl = AnimationController(
    duration: duration,
    vsync: this,
  );

  late final rightWidthCntrl = AnimationController(
    duration: duration,
    vsync: this,
  );

  @override
  void dispose() {
    leftWidthCntrl.dispose();
    rightWidthCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final passcodeLength =
        UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength;
    return Scaffold(
      body: BlocBuilder<NumberPanelBloc, NumberPanelState>(
        builder: (context, state) {
          if (state.passcodeResult == PasscodeResult.fail) {
            _playWrongPasscodeAnimation().whenComplete(() {
              BlocProvider.of<NumberPanelBloc>(context).add(ClearStateEvent());
            });
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextInfo(text: 'Введите ключ доступа'),
              const SizedBox(height: 22),
              AnimationWidthDecorator(
                leftWidthCntrl: leftWidthCntrl,
                rightWidthCntrl: rightWidthCntrl,
                child: PasscodeIndicator(
                  indicatorLength: passcodeLength,
                  activeIndicatorLength: state.currentPasscode.length,
                  passcodeResult: state.passcodeResult,
                ),
              ),
              const SizedBox(height: 52),
              const NumberPanel(),
              const SizedBox(height: 36),
              TextButton(
                onPressed: () async {
                  //
                },
                child: const Text(
                  'Войти по логину и паролю',
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Future<void> _playWrongPasscodeAnimation() async {
    _resetCounter();
    try {
      while (currentAnimationRepeatCounter < maxAnimationRepeatCounter) {
        await leftWidthCntrl.forward().orCancel;
        await leftWidthCntrl.reverse().orCancel;
        await rightWidthCntrl.forward().orCancel;
        await rightWidthCntrl.reverse().orCancel;
        currentAnimationRepeatCounter++;
      }
    } on TickerCanceled catch (e) {
      debugPrint('Ticker exception: $e');
    }
  }

  void _resetCounter() {
    currentAnimationRepeatCounter = 0;
  }
}
