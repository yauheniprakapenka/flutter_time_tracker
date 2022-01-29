import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home_page.dart';
import '../password_panels/number_panel/bloc/number_access_bloc/number_panel_bloc.dart';

class PasscodeApp extends StatelessWidget {
  const PasscodeApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NumberPanelBloc>(
            create: (_) => NumberPanelBloc(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
