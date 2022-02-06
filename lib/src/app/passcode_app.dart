import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:number_panel/number_panel.dart';

import '../ui/features/passcode/navigator/passcode_flow_navigator.dart';
import '../ui/shared/theme/theme_data/app_theme_data.dart';

class PasscodeApp extends StatelessWidget {
  final PasscodeFlow _passcodeFlow;

  PasscodeApp({
    Key? key,
    required PasscodeFlow passcodeFlow,
    required int passcodeLength,
  })  : _passcodeFlow = passcodeFlow,
        super(key: key) {
    final passcodeConfig = PasscodeConfig(passcodeLength: passcodeLength);
    GetIt.I.registerLazySingleton<PasscodeConfig>(() => passcodeConfig);
  }

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PasscodeBloc>(create: (_) => PasscodeBloc(_passcodeFlow)),
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
// TODO(e): Перенести DataServiceLocator.instance.init();
