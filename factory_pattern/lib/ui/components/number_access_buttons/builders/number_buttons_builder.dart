import 'package:access_key/ui/bloc/number_access_bloc/events/events.dart';
import 'package:access_key/ui/bloc/number_access_bloc/number_access_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../decorators/button_decorator.dart';
import '../widgets/key_button.dart';
import 'buttons_row_builder.dart';

class NumberButtonsBuilder extends StatelessWidget {
  final int from;
  final int to;

  const NumberButtonsBuilder({
    Key? key,
    required this.from,
    required this.to,
  }) : super(key: key);

  @override
  Widget build(context) {
    final buttons = <Widget>[];
    for (var i = from; i < to + 1; i++) {
      buttons.add(
        ButtonDecorator(
          button: KeyButton(
            title: '$i',
            onPressed: () {
              // BlocProvider.of<NumberAccessBloc>(context)
              //     .add(ButtonTwoPressedEvent());
            },
          ),
        ),
      );
    }

    return ButtonsRowBuilder(
      buttons: buttons,
    );
  }
}
