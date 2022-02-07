import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../../../../app/di/app_color_service_locator.dart';
import '../../../../shared/localization/i_localization.dart';
import '../../../../shared/theme/colors/number_panel_color_impl.dart';
import '../../widgets/delete_icon.dart';
import '../../adapters/passcode_adapter.dart';
import '../../adapters/passcode_adapter_with_animation.dart';
import '../../widgets/task_text.dart';
import '../observers/cancel_button_observer.dart';

class PasscodePageBuilder extends StatelessWidget {
  /// Пример:
  /// - Введите текущий ключ доступа
  /// - Повторите ключ доступа
  /// - Придумайте ключ доступа
  final String taskText;

  /// Если `true`, то если введенный ключ доступа не совпал с сохраненным, то воспроизведется анимация
  /// несовпадающего ключа доступа.
  final bool passcodeAdapterWithAnimation;

  const PasscodePageBuilder({
    Key? key,
    required this.taskText,
    required this.passcodeAdapterWithAnimation,
  }) : super(key: key);

  @override
  Widget build(context) {
    final serviceLocator = AppColorServiceLocator.instance;
    final localization = serviceLocator.get<ILocalization>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: _onCancelButtonPressed,
              child: Text(localization.cancel),
            ),
          ),
          const SizedBox(height: 22),
          _TaskTextView(taskText: taskText),
          const SizedBox(height: 22),
          passcodeAdapterWithAnimation ? const PasscodeAdapterWithAnimation() : const PasscodeAdapter(),
          const SizedBox(height: 52),
          NumberPanel(
            passcodeLength: AppColorServiceLocator.instance.get<PasscodeConfig>().passcodeLength,
            deleteIcon: const DeleteIcon(),
            colors: NumberPanelColorImpl(),
          ),
        ],
      ),
    );
  }

  void _onCancelButtonPressed() {
    final _cancelButtonObserver = AppColorServiceLocator.instance.get<CancelButtonObserver>();
    _cancelButtonObserver.controller.add('Нажата «Отмена» на экране: «$taskText»');
  }
}

class _TaskTextView extends StatelessWidget {
  final String taskText;

  const _TaskTextView({Key? key, required this.taskText}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<PasscodeBloc, PasscodeState>(builder: (context, passcodeState) {
      final localization = AppColorServiceLocator.instance.get<ILocalization>();
      return passcodeState.passcodeResult == PasscodeResult.notMatches
          ? TaskText(text: localization.passcodeEnteredIncorrectly, hasErrorStyle: true)
          : TaskText(text: taskText);
    });
  }
}
