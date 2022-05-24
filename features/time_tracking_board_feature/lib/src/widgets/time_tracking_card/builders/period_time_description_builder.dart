import 'package:core_ui/core_ui.dart';

import '../../../models/period_time_type.dart';

String buildPeriodTimeDescription(PeriodTimeType periodTimeType) {
  if (periodTimeType == PeriodTimeType.daily) {
    return 'timeTrackingBoardFeature.yesterday'.tr();
  }
  if (periodTimeType == PeriodTimeType.weekly) {
    return 'timeTrackingBoardFeature.lastWeek'.tr();
  }
  return 'timeTrackingBoardFeature.lastMonth'.tr();
}
