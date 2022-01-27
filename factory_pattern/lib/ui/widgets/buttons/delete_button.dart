// ignore_for_file: prefer-extracting-callbacks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/number_access_bloc/events/events.dart';
import '../../bloc/number_access_bloc/number_access_bloc.dart';
import '../../config/sizes.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NumberAccessBloc>(context).add(
          ButtonDeletePressedEvent(),
        );
      },
      child: const SizedBox.square(
        dimension: kButtonSize,
        child: Icon(
          Icons.backspace,
          size: 40,
        ),
      ),
    );
  }
}
