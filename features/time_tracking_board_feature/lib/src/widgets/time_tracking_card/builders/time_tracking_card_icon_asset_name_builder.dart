import 'package:core_ui/core_ui.dart';

import '../../../models/time_tracking_card_type.dart';

String buildCardTrackingIconAssetName(TimeTrackingCardType timeTrackingCardType) {
  if (timeTrackingCardType == TimeTrackingCardType.work) {
    return AppIcons.work;
  }

  if (timeTrackingCardType == TimeTrackingCardType.play) {
    return AppIcons.play;
  }

  if (timeTrackingCardType == TimeTrackingCardType.study) {
    return AppIcons.study;
  }

  if (timeTrackingCardType == TimeTrackingCardType.exercise) {
    return AppIcons.exercise;
  }

  if (timeTrackingCardType == TimeTrackingCardType.social) {
    return AppIcons.social;
  }

  if (timeTrackingCardType == TimeTrackingCardType.selfCare) {
    return AppIcons.selfCare;
  }

  return AppIcons.ellipsis;
}
