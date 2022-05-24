
import 'package:core_ui/core_ui.dart';

import '../../../models/time_tracking_card_type.dart';

String buildTimeTrackingCardTitle(TimeTrackingCardType timeTrackingCardType) {
  const notFoundLocalization = '-';

  if (timeTrackingCardType == TimeTrackingCardType.work) {
    return 'timeTrackingBoardFeature.work'.tr();
  }

  if (timeTrackingCardType == TimeTrackingCardType.play) {
    return 'timeTrackingBoardFeature.play'.tr();
  }

  if (timeTrackingCardType == TimeTrackingCardType.study) {
    return 'timeTrackingBoardFeature.study'.tr();
  }

  if (timeTrackingCardType == TimeTrackingCardType.exercise) {
    return 'timeTrackingBoardFeature.exercise'.tr();
  }

  if (timeTrackingCardType == TimeTrackingCardType.social) {
    return 'timeTrackingBoardFeature.social'.tr();
  }

  if (timeTrackingCardType == TimeTrackingCardType.selfCare) {
    return 'timeTrackingBoardFeature.selfCare'.tr();
  }

  return notFoundLocalization;
}
