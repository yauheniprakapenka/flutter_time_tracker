class Result {
  final ResultType resultType;
  final String description;

  const Result({required this.resultType, required this.description});

  @override
  String toString() => 'Result(resultType: $resultType, description: $description)';
}

enum ResultType {
  success,
  error,
}
