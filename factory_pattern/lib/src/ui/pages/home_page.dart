import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../app/config/i_passcode_config.dart';
import '../../app/services/ui_service_locator.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final passwordLength =
        UIServiceLocator.instance.get<IPasscodeConfig>().passcodeLength;
    return Scaffold(
      body: BlocBuilder<NumberPanelBloc, NumberPanelState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextInfo(text: 'Введите ключ доступа'),
                const SizedBox(height: 22),
                PasscodeIndicator(
                  indicatorLength: passwordLength,
                  activeIndicatorLength: state.currentPassword.length,
                  passcodeResult: state.passcodeResult,
                ),
                const SizedBox(height: 52),
                const NumberPanel(),
                const SizedBox(height: 36),
                TextButton(
                  onPressed: () {
                    UnimplementedError('dsafa');
                  },
                  child: const Text(
                    'Войти по логину и паролю',
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
