import 'package:flutter/material.dart';

import '../../../../services/ui_service_locator.dart';
import '../../../../theme/size/interface/i_app_size.dart';

class ButtonPlaceholder extends StatelessWidget {
  const ButtonPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final appSize = UIServiceLocator.instance.get<IAppSize>();
    return SizedBox.square(
      dimension: appSize.passwordButtonSize,
    );
  }
}
