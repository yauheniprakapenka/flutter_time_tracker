// ignore_for_file: prefer-extracting-callbacks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/number_access_bloc/events/events.dart';
import '../../bloc/number_access_bloc/number_panel_bloc.dart';
import '../builders/buttons_row_builder.dart';
import '../decorators/button_padding_decorator.dart';
import '../widgets/button_placeholder.dart';
import '../widgets/delete_button.dart';
import '../widgets/password_button.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return ButtonsRowBuilder(
      buttons: [
        const ButtonPaddingDecorator(child: ButtonPlaceholder()),
        ButtonPaddingDecorator(
          child: PasswordButton(
              titleNumber: 0,
              onPressed: (pressedNumber) {
                BlocProvider.of<NumberPanelBloc>(context).add(
                  PasswordButtonPressedEvent(pressedValue: '$pressedNumber'),
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
