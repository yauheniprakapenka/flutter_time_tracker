import 'package:flutter/material.dart';

import '../../../widgets/buttons/buttons.dart';
import '../builders/buttons_row_builder.dart';
import '../widgets/button_placeholder.dart';

class CustomRowWithButtons extends StatelessWidget {
  const CustomRowWithButtons({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return ButtonsRowBuilder(
      buttons: [
        const ButtonPlaceholder(),
        zeroButton,
        const DeleteButton(),
      ],
    );
  }
}
