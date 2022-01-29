import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../password_panels/number_panel/bloc/number_access_bloc/number_panel_bloc.dart';
import '../password_panels/number_panel/bloc/number_access_bloc/number_panel_state.dart';
import '../password_panels/number_panel/ui/number_panel.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: BlocBuilder<NumberPanelBloc, NumberPanelState>(
        builder: (context, numberState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInfo(text: 'Введите ключ доступа'),
                SizedBox(height: 22),
                PageIndicator(
                  indicatorCount: 4,
                  activeIndicatorCount: 2,
                ),
                SizedBox(height: 52),
                NumberPanel(),
                SizedBox(height: 36),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Войти по логину и паролю',
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
