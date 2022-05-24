import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

import '../filters/filter.dart';
import '../models/period_time_type.dart';
import '../models/time_frame_filter.dart';
import 'time_tracking_board_event.dart';
import 'time_tracking_board_state.dart';

export 'time_tracking_board_event.dart';
export 'time_tracking_board_state.dart';

class TimeTrackingBoardBloc extends Bloc<TimeTrackingBoardEvent, TimeTrackingBoardState> {
  final TimeFrameRepository _timeFrameRepository;
  late final TimeFrameList _timeFrameList;

  TimeTrackingBoardBloc({
    required TimeFrameRepository timeFrameRepository,
  })  : _timeFrameRepository = timeFrameRepository,
        super(TimeTrackingBoardState.initState()) {
    on<PressDailyButton>(_onPressDailyButton);
    on<PressWeeklyButton>(_onPressWeeklyButton);
    on<PressMonthlyButton>(_onPressMonthlyButton);
    on<LoadTimeFrames>(_onLoadTimeFrames);
  }

  Future<void> _onLoadTimeFrames(LoadTimeFrames _, Emitter<TimeTrackingBoardState> emit) async {
    emit(state.copyWith(isLoading: true));
    _timeFrameList = await _timeFrameRepository.getTimeTracking();
    await _onPressDailyButton(const PressDailyButton(), emit);
  }

  Future<void> _onPressDailyButton(PressDailyButton _, Emitter<TimeTrackingBoardState> emit) async {
    final TimeFrameFilter timeFrameFilter = applyTimeFrameFilter(
      periodTimeType: PeriodTimeType.daily,
      timeFrameList: _timeFrameList,
    );

    emit(
      state.copyWith(
        isLoading: false,
        periodTimeType: PeriodTimeType.daily,
        timeFrameFilter: timeFrameFilter,
      ),
    );
  }

  Future<void> _onPressWeeklyButton(PressWeeklyButton _, Emitter<TimeTrackingBoardState> emit) async {
    final TimeFrameFilter timeFrameFilter = applyTimeFrameFilter(
      periodTimeType: PeriodTimeType.weekly,
      timeFrameList: _timeFrameList,
    );

    emit(
      state.copyWith(
        isLoading: false,
        periodTimeType: PeriodTimeType.weekly,
        timeFrameFilter: timeFrameFilter,
      ),
    );
  }

  Future<void> _onPressMonthlyButton(PressMonthlyButton _, Emitter<TimeTrackingBoardState> emit) async {
    final TimeFrameFilter timeFrameFilter = applyTimeFrameFilter(
      periodTimeType: PeriodTimeType.monthly,
      timeFrameList: _timeFrameList,
    );

    emit(
      state.copyWith(
        isLoading: false,
        periodTimeType: PeriodTimeType.monthly,
        timeFrameFilter: timeFrameFilter,
      ),
    );
  }
}
