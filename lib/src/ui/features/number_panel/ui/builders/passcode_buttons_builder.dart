import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/providers/number_access_bloc/events/events.dart';
import '../../domain/providers/number_access_bloc/number_panel_bloc.dart';
import '../decorators/button_padding_decorator.dart';
import '../widgets/passcode_button.dart';
import 'buttons_row_builder.dart';

class PasscodeButtonsBuilder extends StatelessWidget {
  final int from;
  final int to;

  const PasscodeButtonsBuilder({
    Key? key,
    required this.from,
    required this.to,
  }) : super(key: key);

  @override
  Widget build(context) {
    return ButtonsRowBuilder(
      buttons: buildPasscodeButtons(context: context, from: from, to: to),
    );
  }

  List<Widget> buildPasscodeButtons({
    required BuildContext context,
    required int from,
    required int to,
  }) {
    final buttons = <Widget>[];
    for (var i = from; i < to + 1; i++) {
      buttons.add(
        ButtonPaddingDecorator(
          child: PasscodeButton(
            titleNumber: i,
            onPressed: (pressedNumber) {
              BlocProvider.of<NumberPanelBloc>(context).add(
                PasscodeButtonPressedEvent(pressedValue: '$pressedNumber'),
              );
            },
          ),
        ),
      );
    }
    return buttons;
  }
}
