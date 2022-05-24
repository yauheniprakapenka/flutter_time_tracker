import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../models/period_time_type.dart';
import 'components/profile_menu_button.dart';

class MobileProfileMenu extends StatelessWidget {
  final ImageProvider avatar;
  final String firstName;
  final String lastName;
  final VoidCallback onDailyPressed;
  final VoidCallback onWeeklyPressed;
  final VoidCallback onMonthlyPressed;
  final PeriodTimeType selectedPeriodTimeType;

  static const double _profileMenuHeight = 148.0;
  static const double _topContainerHeight = _profileMenuHeight - 50.0;
  static const double _bottomContainerHeight = _profileMenuHeight - _topContainerHeight;

  const MobileProfileMenu({
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
    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.borderRadius,
          ),
        ),
        child: Stack(
          children: [
            Container(
              color: AppColors.darkBlue,
              height: _profileMenuHeight,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimensions.borderRadius,
                ),
              ),
              child: Container(
                height: _topContainerHeight,
                color: AppColors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.padding24),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: AppColors.circleAvatarBorderColor,
                        child: CircleAvatar(
                          radius: 26,
                          backgroundImage: avatar,
                        ),
                      ),
                      const SizedBox(width: AppDimensions.padding24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'timeTrackingBoardFeature.reportFor'.tr(),
                            style: AppTextStyle.rubicRegular12.copyWith(color: AppColors.paleBlue),
                          ),
                          Row(
                            children: [
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  '$firstName $lastName',
                                  style: AppTextStyle.rubicLight28,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: _bottomContainerHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          ],
        ),
      ),
    );
  }
}
