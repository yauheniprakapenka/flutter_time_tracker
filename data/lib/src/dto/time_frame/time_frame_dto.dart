import 'time_frames_dto.dart';

class TimeFrameDTO {
  final TimeFramesDTO timeframes;
  final String title;

  const TimeFrameDTO({
    required this.timeframes,
    required this.title,
  });

  factory TimeFrameDTO.fromJson(Map<String, dynamic> json) {
    return TimeFrameDTO(
      title: json['title'],
      timeframes: TimeFramesDTO.fromJson(json['timeframes']),
    );
  }
}
