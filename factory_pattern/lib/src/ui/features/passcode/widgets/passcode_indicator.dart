import 'package:flutter/material.dart';

import '../../../../app/models/passcode_result.dart';
import '../../../../app/services/ui_service_locator.dart';
import '../../../../app/theme/colors/i_app_color.dart';

class PasscodeIndicator extends StatelessWidget {
  final int indicatorLength;
  final int activeIndicatorLength;
  final PasscodeResult passcodeResult;

  const PasscodeIndicator({
    Key? key,
    required this.indicatorLength,
    required this.activeIndicatorLength,
    required this.passcodeResult,
  })  : assert(activeIndicatorLength <= indicatorLength),
        super(key: key);

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(indicatorLength, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: _Indicator(
            color: _getColor(passcodeResult, index),
          ),
        );
      }),
    );
  }

  Color _getColor(PasscodeResult passcodeResult, int index) {
    final appColor = UIServiceLocator.instance.get<IAppColor>();
    if (activeIndicatorLength < (index + 1)) return appColor.primary;
    switch (passcodeResult) {
      case PasscodeResult.passcodeEntring:
        return appColor.onPrimaryVariant;
      case PasscodeResult.passcodeMatches:
        return appColor.success;
      case PasscodeResult.passcodeNotMatches:
        return appColor.error;
    }
  }
}

class _Indicator extends StatelessWidget {
  final Color color;

  const _Indicator({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox.square(
      dimension: 12.5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
