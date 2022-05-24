class PeriodTimeFrame {
  final int current;
  final int previous;

  const PeriodTimeFrame({
    required this.current,
    required this.previous,
  });
}

class Daily extends PeriodTimeFrame {
  const Daily({
    required super.current,
    required super.previous,
  });
}

class Weekly extends PeriodTimeFrame {
  const Weekly({
    required super.current,
    required super.previous,
  });
}

class Monthly extends PeriodTimeFrame {
  const Monthly({
    required super.current,
    required super.previous,
  });
}
