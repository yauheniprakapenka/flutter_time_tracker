import 'package:domain/domain.dart';

import '../../dto/time_frame/daily_time_frame_dto.dart';
import '../../dto/time_frame/monthly_time_frame_dto.dart';
import '../../dto/time_frame/time_frame_dto.dart';
import '../../dto/time_frame/time_frame_list_dto.dart';
import '../../dto/time_frame/time_frames_dto.dart';
import '../../dto/time_frame/weekly_time_frame_dto.dart';

Daily mapDailyDtoToDaily(DailyTimeFrameDTO dailyDTO) {
  return Daily(
    current: dailyDTO.current,
    previous: dailyDTO.previous,
  );
}

Monthly mapMonthlyDtoToDaily(MonthlyTimeFrameDTO monthlyDTO) {
  return Monthly(
    current: monthlyDTO.current,
    previous: monthlyDTO.previous,
  );
}

TimeFrame mapTimeFrameDtoToTimeFrame(TimeFrameDTO timeFrameDTO) {
  return TimeFrame(
    title: timeFrameDTO.title,
    timeframes: mapTimeFrameDTOToTimeFrameMapper(timeFrameDTO.timeframes),
  );
}

TimeFrames mapTimeFrameDTOToTimeFrameMapper(TimeFramesDTO timeFramesDTO) {
  return TimeFrames(
    dailyTimeFrame: mapDailyDtoToDaily(timeFramesDTO.dailyTimeFrameDTO),
    weeklyTimeFrame: mapWeeklyDtoToWeekly(timeFramesDTO.weeklyTimeFrameDTO),
    monthlyTimeFrime: mapMonthlyDtoToDaily(timeFramesDTO.monthlyTimeFrameDTO),
  );
}

TimeFrameList mapTimeFrameListDtoToTimeFrameList(TimeFrameListDTO timeFrameListDTO) {
  // ignore: unnecessary_lambdas
  return TimeFrameList(timeframes: timeFrameListDTO.timeframes.map((TimeFrameDTO timeFrameDTO) {
    return mapTimeFrameDtoToTimeFrame(timeFrameDTO);
  }).toList());
}

Weekly mapWeeklyDtoToWeekly(WeeklyTimeFrameDTO weeklyTimeFrameDTO) {
  return Weekly(
    current: weeklyTimeFrameDTO.current,
    previous: weeklyTimeFrameDTO.previous,
  );
}
