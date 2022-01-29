import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../password_panels/number_panel/bloc/number_access_bloc/number_panel_bloc.dart';
import '../password_panels/number_panel/bloc/number_access_bloc/number_panel_state.dart';
import '../password_panels/number_panel/ui/number_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: BlocBuilder<NumberPanelBloc, NumberPanelState>(
        builder: (context, numberState) {
          return const Center(
            child: NumberPanel(),
          );
        },
      ),
    );
  }
}
