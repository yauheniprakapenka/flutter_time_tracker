import '../../entities/time_frame/time_frame_list.dart';

abstract class TimeFrameRepository {
  const TimeFrameRepository();

  Future<TimeFrameList> getTimeTracking();
}
