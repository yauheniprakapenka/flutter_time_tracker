import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/providers/number_access_bloc/events/events.dart';
import '../../domain/providers/number_access_bloc/number_panel_bloc.dart';
import '../builders/buttons_row_builder.dart';
import '../decorators/button_padding_decorator.dart';
import '../widgets/button_placeholder.dart';
import '../widgets/delete_button.dart';
import '../widgets/passcode_button.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return ButtonsRowBuilder(
      buttons: [
        const ButtonPaddingDecorator(child: ButtonPlaceholder()),
        ButtonPaddingDecorator(
          child: PasscodeButton(
              titleNumber: 0,
              onPressed: (pressedNumber) {
                BlocProvider.of<NumberPanelBloc>(context).add(
                  PasscodeButtonPressedEvent(pressedValue: '$pressedNumber'),
                );
              }),
        ),
        ButtonPaddingDecorator(
          child: DeleteButton(
            onPressed: () {
              BlocProvider.of<NumberPanelBloc>(context).add(
                DeleteButtonPressedEvent(),
              );
            },
          ),
        ),
      ],
    );
  }
}
