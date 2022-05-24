import 'package:domain/domain.dart';

abstract class TimeFrameProvider {
  const TimeFrameProvider();
  
  Future<TimeFrameList> getTimeTracking();
}
