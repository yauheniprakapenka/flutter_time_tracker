class Passcode {
  /// Используется в случаях:
  /// - Придумайте ключ доступа
  final String tempEnteredPasscode;

  /// Используется в случаях:
  /// - Введите текущий ключ доступа
  /// - Повторите ключ доступа
  final String createdPasscode;

  const Passcode({
    this.tempEnteredPasscode = '',
    this.createdPasscode = '',
  });

  @override
  String toString() => 'Passcode(tempEnteredPasscode: $tempEnteredPasscode, createdPasscode: $createdPasscode)';

  Passcode copyWith({String? tempEnteredPasscode, String? createdPasscode}) {
    return Passcode(
      tempEnteredPasscode: tempEnteredPasscode ?? this.tempEnteredPasscode,
      createdPasscode: createdPasscode ?? this.createdPasscode,
    );
  }
}
