import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../ui/features/passcode/navigator/passcode_flow_navigator.dart';
import '../ui/shared/theme/theme_data/app_theme_data.dart';

class PasscodeApp extends StatelessWidget {
  final PasscodeFlow _passcodeFlow;

  const PasscodeApp({
    Key? key,
    required PasscodeFlow passcodeFlow,
  })  : _passcodeFlow = passcodeFlow,
        super(key: key);

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
