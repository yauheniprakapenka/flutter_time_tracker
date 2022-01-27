// ignore_for_file: prefer-extracting-callbacks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/number_access_bloc/events/i_number_access_event.dart';
import '../../../bloc/number_access_bloc/number_access_bloc.dart';
import '../../../config/sizes.dart';

class PasswordButton extends StatelessWidget {
  final String title;
  final INumberAccessEvent numberAccessEvent;

  const PasswordButton({
    Key? key,
    required this.title,
    required this.numberAccessEvent,
  }) : super(key: key);

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NumberAccessBloc>(context).add(numberAccessEvent);
      },
      child: Container(
        width: kButtonSize,
        height: kButtonSize,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
