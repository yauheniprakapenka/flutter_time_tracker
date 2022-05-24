import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../models/period_time_type.dart';
import 'components/profile_menu_button.dart';

class DesktopProfileMenu extends StatelessWidget {
  final ImageProvider avatar;
  final String firstName;
  final String lastName;
  final PeriodTimeType selectedPeriodTimeType;
  final VoidCallback onDailyPressed;
  final VoidCallback onWeeklyPressed;
  final VoidCallback onMonthlyPressed;

  static const double _profileMenuHeight = 360.0;
  static const double _profileMenuWidth = 180.0;
  static const double _topContainerHeight = _profileMenuHeight - 100.0;
  static const double _bottomContainerHeight = _profileMenuHeight - _topContainerHeight;

  const DesktopProfileMenu({
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.onDailyPressed,
    required this.onWeeklyPressed,
    required this.onMonthlyPressed,
    required this.selectedPeriodTimeType,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          AppDimensions.borderRadius,
        ),
      ),
      child: Stack(
        children: [
          Container(
            color: AppColors.darkBlue,
            width: _profileMenuWidth,
            height: _profileMenuHeight,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppDimensions.borderRadius,
              ),
            ),
            child: Container(
              width: _profileMenuWidth,
              height: _topContainerHeight,
              color: AppColors.blue,
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.padding24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.circleAvatarBorderColor,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage: avatar,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'timeTrackingBoardFeature.reportFor'.tr(),
                      style: AppTextStyle.rubicRegular12.copyWith(color: AppColors.paleBlue),
                    ),
                    Text(firstName, style: AppTextStyle.rubicLight28),
                    Text(lastName, style: AppTextStyle.rubicLight28),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: AppDimensions.padding24),
              child: SizedBox(
                height: _bottomContainerHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileMenuButton(
                      title: 'timeTrackingBoardFeature.daily'.tr(),
                      isActive: selectedPeriodTimeType == PeriodTimeType.daily,
                      onPressed: onDailyPressed,
                    ),
                    ProfileMenuButton(
                      title: 'timeTrackingBoardFeature.weekly'.tr(),
                      isActive: selectedPeriodTimeType == PeriodTimeType.weekly,
                      onPressed: onWeeklyPressed,
                    ),
                    ProfileMenuButton(
                      title: 'timeTrackingBoardFeature.monthly'.tr(),
                      isActive: selectedPeriodTimeType == PeriodTimeType.monthly,
                      onPressed: onMonthlyPressed,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
