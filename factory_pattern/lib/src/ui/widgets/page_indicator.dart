import 'package:flutter/material.dart';

import '../../app/services/ui_service_locator.dart';
import '../../app/theme/colors/i_app_color.dart';

class PageIndicator extends StatelessWidget {
  final int indicatorLength;
  final int activeIndicatorLength;

  const PageIndicator({
    Key? key,
    required this.indicatorLength,
    required this.activeIndicatorLength,
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
            isActive: activeIndicatorLength < (index + 1),
          ),
        );
      }),
    );
  }
}

class _Indicator extends StatelessWidget {
  final bool isActive;

  const _Indicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(context) {
    final appColor = UIServiceLocator.instance.get<IAppColor>();
    return SizedBox.square(
      dimension: 12.5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? appColor.primary : appColor.onPrimaryVariant,
        ),
      ),
    );
  }
}
