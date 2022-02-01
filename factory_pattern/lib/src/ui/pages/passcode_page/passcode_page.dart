import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../app/config/i_passcode_config.dart';
import '../../../app/services/ui_service_locator.dart';
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
                  currentAnimationRepeatCounter = 0;
                  await playWrongPasscodeAnimation();
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

  Future<void> playWrongPasscodeAnimation() async {
    try {
      while (currentAnimationRepeatCounter < maxAnimationRepeatCounter) {
        await leftWidthCntrl.forward().orCancel;
        await leftWidthCntrl.reverse().orCancel;
        await rightWidthCntrl.forward().orCancel;
        await rightWidthCntrl.reverse().orCancel;
        currentAnimationRepeatCounter++;
      }
      debugPrint('Анимация завершена');
    } on TickerCanceled catch (e) {
      debugPrint('Ticker exception: $e');
    }
  }
}
