import '../../domain.dart';

class Result {
  final PasscodeResult passcodeResult;
  final String description;

  const Result({required this.passcodeResult, required this.description});

  @override
  String toString() => 'Result(passcodeResult: $passcodeResult, description: $description)';
}
