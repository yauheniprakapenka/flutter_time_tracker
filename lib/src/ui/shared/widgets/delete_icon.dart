import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/di/app_color_service_locator.dart';
import '../theme/colors/i_app_color.dart';

class DeleteIcon extends StatelessWidget {
  static const _widthIcon = 46.0;
  static const _heightIcon = 34.0;
  static const _crossIconSize = 18.0;
  static const _leftPadding = _widthIcon - _heightIcon;

  const DeleteIcon({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final appColor = AppColorServiceLocator.instance.get<IAppColor>();
    return Center(
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/delete/rectangle.svg',
            color: appColor.primary,
            width: _widthIcon,
            height: _heightIcon,
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(left: _leftPadding),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/delete/cross.svg',
                  color: appColor.onPrimary,
                  width: _crossIconSize,
                  height: _crossIconSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
