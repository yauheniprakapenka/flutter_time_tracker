import 'package:domain/domain.dart';

import '../models/period_time_type.dart';
import '../models/time_frame_filter.dart';
import '../models/work_time_frame.dart';

TimeFrameFilter applyTimeFrameFilter({required PeriodTimeType periodTimeType, required TimeFrameList timeFrameList}) {
  final Play play = _getPlay(periodTimeType: periodTimeType, timeFrameList: timeFrameList);
  final Work work = _getWork(periodTimeType: periodTimeType, timeFrameList: timeFrameList);
  final Study study = _getStudy(periodTimeType: periodTimeType, timeFrameList: timeFrameList);
  final Exercise exercise = _getExercise(periodTimeType: periodTimeType, timeFrameList: timeFrameList);
  final Social social = _getSocial(periodTimeType: periodTimeType, timeFrameList: timeFrameList);
  final SelfCare selfCare = _getSelfCare(periodTimeType: periodTimeType, timeFrameList: timeFrameList);

  return TimeFrameFilter(
    work: work,
    play: play,
    study: study,
    exercise: exercise,
    social: social,
    selfCare: selfCare,
  );
}

Play _getPlay({required PeriodTimeType periodTimeType, required TimeFrameList timeFrameList}) {
  final TimeFrame playTimeFrame = timeFrameList.timeframes.firstWhere((TimeFrame timeFrame) {
    return timeFrame.title == 'Play';
  });

  if (periodTimeType == PeriodTimeType.daily) {
    return Play(
      current: playTimeFrame.timeframes.dailyTimeFrame.current,
      previous: playTimeFrame.timeframes.dailyTimeFrame.previous,
    );
  }

  if (periodTimeType == PeriodTimeType.weekly) {
    return Play(
      current: playTimeFrame.timeframes.weeklyTimeFrame.current,
      previous: playTimeFrame.timeframes.weeklyTimeFrame.previous,
    );
  }

  return Play(
    current: playTimeFrame.timeframes.monthlyTimeFrime.current,
    previous: playTimeFrame.timeframes.monthlyTimeFrime.previous,
  );
}

Work _getWork({required PeriodTimeType periodTimeType, required TimeFrameList timeFrameList}) {
  final TimeFrame workTimeFrame = timeFrameList.timeframes.firstWhere((TimeFrame timeFrame) {
    return timeFrame.title == 'Work';
  });

  if (periodTimeType == PeriodTimeType.daily) {
    return Work(
      current: workTimeFrame.timeframes.dailyTimeFrame.current,
      previous: workTimeFrame.timeframes.dailyTimeFrame.previous,
    );
  }

  if (periodTimeType == PeriodTimeType.weekly) {
    return Work(
      current: workTimeFrame.timeframes.weeklyTimeFrame.current,
      previous: workTimeFrame.timeframes.weeklyTimeFrame.previous,
    );
  }

  return Work(
    current: workTimeFrame.timeframes.monthlyTimeFrime.current,
    previous: workTimeFrame.timeframes.monthlyTimeFrime.previous,
  );
}

Study _getStudy({required PeriodTimeType periodTimeType, required TimeFrameList timeFrameList}) {
  final TimeFrame studyTimeFrame = timeFrameList.timeframes.firstWhere((TimeFrame timeFrame) {
    return timeFrame.title == 'Study';
  });

  if (periodTimeType == PeriodTimeType.daily) {
    return Study(
      current: studyTimeFrame.timeframes.dailyTimeFrame.current,
      previous: studyTimeFrame.timeframes.dailyTimeFrame.previous,
    );
  }

  if (periodTimeType == PeriodTimeType.weekly) {
    return Study(
      current: studyTimeFrame.timeframes.weeklyTimeFrame.current,
      previous: studyTimeFrame.timeframes.weeklyTimeFrame.previous,
    );
  }

  return Study(
    current: studyTimeFrame.timeframes.monthlyTimeFrime.current,
    previous: studyTimeFrame.timeframes.monthlyTimeFrime.previous,
  );
}

Exercise _getExercise({required PeriodTimeType periodTimeType, required TimeFrameList timeFrameList}) {
  final TimeFrame exerciseTimeFrame = timeFrameList.timeframes.firstWhere((TimeFrame timeFrame) {
    return timeFrame.title == 'Exercise';
  });

  if (periodTimeType == PeriodTimeType.daily) {
    return Exercise(
      current: exerciseTimeFrame.timeframes.dailyTimeFrame.current,
      previous: exerciseTimeFrame.timeframes.dailyTimeFrame.previous,
    );
  }

  if (periodTimeType == PeriodTimeType.weekly) {
    return Exercise(
      current: exerciseTimeFrame.timeframes.weeklyTimeFrame.current,
      previous: exerciseTimeFrame.timeframes.weeklyTimeFrame.previous,
    );
  }

  return Exercise(
    current: exerciseTimeFrame.timeframes.monthlyTimeFrime.current,
    previous: exerciseTimeFrame.timeframes.monthlyTimeFrime.previous,
  );
}

Social _getSocial({required PeriodTimeType periodTimeType, required TimeFrameList timeFrameList}) {
  final TimeFrame socialTimeFrame = timeFrameList.timeframes.firstWhere((TimeFrame timeFrame) {
    return timeFrame.title == 'Social';
  });

  if (periodTimeType == PeriodTimeType.daily) {
    return Social(
      current: socialTimeFrame.timeframes.dailyTimeFrame.current,
      previous: socialTimeFrame.timeframes.dailyTimeFrame.previous,
    );
  }

  if (periodTimeType == PeriodTimeType.weekly) {
    return Social(
      current: socialTimeFrame.timeframes.weeklyTimeFrame.current,
      previous: socialTimeFrame.timeframes.weeklyTimeFrame.previous,
    );
  }

  return Social(
    current: socialTimeFrame.timeframes.monthlyTimeFrime.current,
    previous: socialTimeFrame.timeframes.monthlyTimeFrime.previous,
  );
}

SelfCare _getSelfCare({required PeriodTimeType periodTimeType, required TimeFrameList timeFrameList}) {
  final TimeFrame selfCareTimeFrame = timeFrameList.timeframes.firstWhere((TimeFrame timeFrame) {
    return timeFrame.title == 'Self Care';
  });

  if (periodTimeType == PeriodTimeType.daily) {
    return SelfCare(
      current: selfCareTimeFrame.timeframes.dailyTimeFrame.current,
      previous: selfCareTimeFrame.timeframes.dailyTimeFrame.previous,
    );
  }

  if (periodTimeType == PeriodTimeType.weekly) {
    return SelfCare(
      current: selfCareTimeFrame.timeframes.weeklyTimeFrame.current,
      previous: selfCareTimeFrame.timeframes.weeklyTimeFrame.previous,
    );
  }

  return SelfCare(
    current: selfCareTimeFrame.timeframes.monthlyTimeFrime.current,
    previous: selfCareTimeFrame.timeframes.monthlyTimeFrime.previous,
  );
}
