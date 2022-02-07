abstract class ILocalization {
  /// Например, 'Придумайте ключ доступа'
  String get createPasscode;

  /// Например, 'Повторите ключ доступа'
  String get repeatPasscode;

  /// Например, 'Введите текущий ключ доступа'
  String get enterCurrentPasscode;

  /// Например, 'Войти по логину и паролю'
  String get loginWithNameAndPassword;

  /// Например, 'Неверно введен ключ доступа'
  String get passcodeEnteredIncorrectly;

  /// Например, 'Отмена'
  String get cancel;
}
