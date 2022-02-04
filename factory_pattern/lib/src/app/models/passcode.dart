class Passcode {
  /// Используется в случаях:
  /// - Придумайте ключ доступа
  var tempEnteredPasscode = '';

  /// Используется в случаях:
  /// - Введите текущий ключ доступа
  /// - Повторите ключ доступа
  var createdPasscode = '';

  @override
  String toString() => 'Passcode(tempEnteredPasscode: $tempEnteredPasscode, createdPasscode: $createdPasscode)';
}
