import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../hover_decorator.dart';

class ProfileMenuButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isActive;

  const ProfileMenuButton({
    required this.onPressed,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: HoverDecorator(
        builder: (bool isHover) {
          return Text(
            title,
            style: TextStyle(
              color: _getColor(isHover),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          );
        },
      ),
    );
  }

  Color _getColor(bool isHover) {
    if (isActive) return AppColors.textColor;
    return isHover ? AppColors.textColor : AppColors.paleBlue;
  }
}
