import 'time_frame_dto.dart';

class TimeFrameListDTO {
  final List<TimeFrameDTO> timeframes;

  const TimeFrameListDTO({
    required this.timeframes,
  });

  factory TimeFrameListDTO.fromJson(List<dynamic> json) {
    final List<TimeFrameDTO> daily = json.map((e) {
      return TimeFrameDTO.fromJson(e);
    }).toList();
    return TimeFrameListDTO(timeframes: daily);
  }
}
