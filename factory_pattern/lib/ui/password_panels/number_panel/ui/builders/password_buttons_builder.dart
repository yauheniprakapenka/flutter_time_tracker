import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/number_access_bloc/events/events.dart';
import '../../bloc/number_access_bloc/number_panel_bloc.dart';
import '../decorators/button_padding_decorator.dart';
import '../widgets/password_button.dart';
import 'buttons_row_builder.dart';

class PasswordButtonBuilder extends StatelessWidget {
  final int from;
  final int to;

  const PasswordButtonBuilder({
    Key? key,
    required this.from,
    required this.to,
  }) : super(key: key);

  @override
  Widget build(context) {
    return ButtonsRowBuilder(
      buttons: buildPasswordButtons(context: context, from: from, to: to),
    );
  }

  List<Widget> buildPasswordButtons({
    required BuildContext context,
    required int from,
    required int to,
  }) {
    final buttons = <Widget>[];
    for (var i = from; i < to + 1; i++) {
      buttons.add(
        ButtonPaddingDecorator(
          child: PasswordButton(
            titleNumber: i,
            onPressed: (pressedNumber) {
              BlocProvider.of<NumberPanelBloc>(context).add(
                  PasswordButtonPressedEvent(pressedValue: '$pressedNumber'),
                );
            },
          ),
        ),
      );
    }
    return buttons;
  }
}
