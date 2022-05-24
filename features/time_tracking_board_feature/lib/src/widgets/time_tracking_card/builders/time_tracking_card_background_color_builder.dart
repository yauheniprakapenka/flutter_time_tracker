
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../../models/time_tracking_card_type.dart';

Color buildTimeTrackingCardBackgroundColor(TimeTrackingCardType timeTrackingCardType) {
  if (timeTrackingCardType == TimeTrackingCardType.work) {
    return AppColors.lightRedWork;
  }

  if (timeTrackingCardType == TimeTrackingCardType.play) {
    return AppColors.softBluePlay;
  }

  if (timeTrackingCardType == TimeTrackingCardType.study) {
    return AppColors.lightRedStudy;
  }

  if (timeTrackingCardType == TimeTrackingCardType.exercise) {
    return AppColors.limeGreenExercise;
  }

  if (timeTrackingCardType == TimeTrackingCardType.social) {
    return AppColors.violetSocial;
  }

  if (timeTrackingCardType == TimeTrackingCardType.selfCare) {
    return AppColors.softOrangeSelfCare;
  }

  return Colors.white;
}
