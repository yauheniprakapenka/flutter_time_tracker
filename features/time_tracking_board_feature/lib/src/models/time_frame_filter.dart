import 'work_time_frame.dart';

class TimeFrameFilter {
  final Work work;
  final Play play;
  final Study study;
  final Exercise exercise;
  final Social social;
  final SelfCare selfCare;

  const TimeFrameFilter({
    required this.work,
    required this.play,
    required this.study,
    required this.exercise,
    required this.social,
    required this.selfCare,
  });
}
