import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../ui/features/passcode/navigator/passcode_flow_navigator.dart';
import '../ui/features/passcode/pages/observers/cancel_button_observer.dart';
import '../ui/shared/theme/theme_data/app_theme_data.dart';
import 'di/cancel_button_service_locator.dart';
import 'di/passcode_service_locator.dart';

class PasscodeApp extends StatefulWidget {
  final PasscodeFlow _passcodeFlow;
  final GestureTapCallback _onCancelPressed;

  PasscodeApp({
    Key? key,
    required PasscodeFlow passcodeFlow,
    required int passcodeLength,
    required GestureTapCallback onCancelPressed,
  })  : _passcodeFlow = passcodeFlow,
        _onCancelPressed = onCancelPressed,
        super(key: key) {
    PasscodeServiceLocator.instance.register(passcodeLength);
  }

  @override
  State<PasscodeApp> createState() => _PasscodeAppState();
}

class _PasscodeAppState extends State<PasscodeApp> {
  @override
  void initState() {
    super.initState();
    CancelButtonServiceLocator.instance.register();
    final _cancelButtonObserver = CancelButtonServiceLocator.instance.get<CancelButtonObserver>();
    _cancelButtonObserver.controller.stream.listen((event) {
      widget._onCancelPressed();
    });
  }

  @override
  void dispose() {
    CancelButtonServiceLocator.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PasscodeBloc>(create: (_) => PasscodeBloc(widget._passcodeFlow)),
        BlocProvider<NumberPanelBloc>(create: (_) => NumberPanelBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData().call(),
        home: const PasscodeFlowNavigator(),
      ),
    );
  }
}

// TODO(e): Сохранять в Flutter Storage
// TODO(e): Передавать локализацию
// TODO(e): Добавить callback для кнопки отмена
// TODO(e): Добавить отображение логотипа
// TODO(e): Добавить layout builder
// TODO(e): В сценарии "Изменить ключ доступа" два раза получаем успешный результат так как в нем экран от сцераний войти по ключу доступа
