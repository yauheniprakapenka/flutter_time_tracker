// ignore_for_file: prefer-extracting-callbacks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_access_bloc/number_access_bloc.dart';
import '../pages/home_page.dart';

class RunApp extends StatelessWidget {
  const RunApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NumberAccessBloc>(
            create: (_) => NumberAccessBloc(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
