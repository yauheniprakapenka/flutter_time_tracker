import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_access_bloc/number_panel_bloc.dart';
import '../pages/home_page.dart';
import '../services/ui_service_locator.dart';
import '../theme/themes/interface/i_app_theme.dart';

class PasscodeApp extends StatelessWidget {
  const PasscodeApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final theme = UIServiceLocator.instance.get<IAppTheme>().build();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
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
