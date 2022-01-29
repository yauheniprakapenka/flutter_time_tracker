import 'package:flutter/material.dart';

import '../services/ui_service_locator.dart';
import '../theme/colors/interface/i_app_color.dart';

class PageIndicator extends StatelessWidget {
  final int indicatorCount;
  final int activeIndicatorCount;

  const PageIndicator({
    Key? key,
    required this.indicatorCount,
    required this.activeIndicatorCount,
  })  : assert(activeIndicatorCount <= indicatorCount),
        super(key: key);

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(indicatorCount, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: _Indicator(
              isActive: activeIndicatorCount < (index + 1),
            ),
          );
        })
      ],
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
