import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../providers/time_frame/time_frame_api_provider.dart';
import '../providers/time_frame/time_frame_provider.dart';
import '../repositories/time_frame/time_frame_repository_impl.dart';

class DataDI {
  static void initDependencies() {
    serviceLocator.registerSingleton<TimeFrameProvider>(TimeFrameApiProvider());
    serviceLocator.registerSingleton<TimeFrameRepository>(
      TimeFrameRepositoryImpl(timeFrameProvider: serviceLocator.get<TimeFrameProvider>()),
    );
  }
}
