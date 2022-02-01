import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../ui/features/passcode/pages/passcode_page.dart';
import 'theme/theme_data/app_theme_data.dart';

class PasscodeApp extends StatelessWidget {
  const PasscodeApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocProvider<NumberPanelBloc>(
      create: (_) => NumberPanelBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData().call(),
        home: const PasscodePage(),
      ),
    );
  }
}
