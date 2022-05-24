import 'package:domain/domain.dart';

import '../../providers/time_frame/time_frame_provider.dart';

class TimeFrameRepositoryImpl implements TimeFrameRepository {
  final TimeFrameProvider _timeFrameProvider;

  TimeFrameRepositoryImpl({
    required TimeFrameProvider timeFrameProvider,
  }) : _timeFrameProvider = timeFrameProvider;

  @override
  Future<TimeFrameList> getTimeTracking() async {
    return _timeFrameProvider.getTimeTracking();
  }
}
