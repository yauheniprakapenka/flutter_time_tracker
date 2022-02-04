import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../ui/features/passcode/navigator/passcode_flow_navigator.dart';
import 'bloc/passcode_bloc/passcode_bloc.dart';
import 'theme/theme_data/app_theme_data.dart';

class PasscodeApp extends StatelessWidget {
  const PasscodeApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PasscodeBloc>(create: (_) => PasscodeBloc()),
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
