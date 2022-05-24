import '../models/period_time_type.dart';
import '../models/time_frame_filter.dart';

class TimeTrackingBoardState {
  final bool isLoading;
  final PeriodTimeType periodTimeType;
  final TimeFrameFilter? timeFrameFilter;

  TimeTrackingBoardState({
    required this.isLoading,
    required this.periodTimeType,
    required this.timeFrameFilter,
  });

  factory TimeTrackingBoardState.initState() {
    return TimeTrackingBoardState(
      isLoading: false,
      periodTimeType: PeriodTimeType.weekly,
      timeFrameFilter: null,
    );
  }

  TimeTrackingBoardState copyWith({
    bool? isLoading,
    PeriodTimeType? periodTimeType,
    TimeFrameFilter? timeFrameFilter,
  }) {
    return TimeTrackingBoardState(
      isLoading: isLoading ?? this.isLoading,
      periodTimeType: periodTimeType ?? this.periodTimeType,
      timeFrameFilter: timeFrameFilter ?? this.timeFrameFilter,
    );
  }
}
