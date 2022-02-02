import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';
import 'package:passcode/src/app/bloc/passcode_bloc/events/getting_passcode_from_storage_event.dart';

import '../ui/features/passcode/pages/passcode_page.dart';
import 'bloc/passcode_bloc/passcode_bloc.dart';
import 'theme/theme_data/app_theme_data.dart';

class PasscodeApp extends StatelessWidget {
  const PasscodeApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PasscodeBloc>(create: (_) => PasscodeBloc()..add(GettingPasscodeFromStorageEvent())),
        BlocProvider<NumberPanelBloc>(create: (_) => NumberPanelBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData().call(),
        home: const PasscodePage(),
      ),
    );
  }
}
