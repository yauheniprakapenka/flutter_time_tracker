import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/pages/home_page.dart';
import '../ui/password_panels/number_panel/bloc/number_access_bloc/number_panel_bloc.dart';
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
        home: const HomePage(),
      ),
    );
  }
}
