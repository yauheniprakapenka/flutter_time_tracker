class DailyTimeFrameDTO {
  final int current;
  final int previous;

  const DailyTimeFrameDTO({
    required this.current,
    required this.previous,
  });

  factory DailyTimeFrameDTO.fromJson(Map<String, dynamic> json) {
    return DailyTimeFrameDTO(
      current: json['current'],
      previous: json['previous'],
    );
  }
}
