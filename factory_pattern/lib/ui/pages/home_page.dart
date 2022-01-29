import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_access_bloc/number_access_bloc.dart';
import '../bloc/number_access_bloc/number_access_state.dart';
import '../password_panels/number_panel/number_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: BlocBuilder<NumberAccessBloc, NumberAccessState>(
        builder: (context, numberState) {
          return const Center(
            child: NumberPanel(),
          );
        },
      ),
    );
  }
}
