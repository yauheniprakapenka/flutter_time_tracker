class MonthlyTimeFrameDTO {
  final int current;
  final int previous;

  const MonthlyTimeFrameDTO({
    required this.current,
    required this.previous,
  });

  factory MonthlyTimeFrameDTO.fromJson(Map<String, dynamic> json) {
    return MonthlyTimeFrameDTO(
      current: json['current'],
      previous: json['previous'],
    );
  }
}
