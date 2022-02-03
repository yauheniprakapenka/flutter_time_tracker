import 'i_localization.dart';

class ShellLocalizationImpl implements ILocalization {
  @override
  String get creatPasscode => 'Придумайте ключ доступа';

  @override
  String get repeatPasscode => 'Повторите ключ доступа';

  @override
  String get enterPasscode => 'Введите ключ доступа';

  @override
  String get enterCurrentPasscode => 'Введите текущий ключ доступа';

  @override
  String get cancel => 'Отмена';

  @override
  String get loginWithNameAndPassword => 'Войти по логину и паролю';

  @override
  String get passcodeEnteredIncorrectly => 'Неверно введен ключ доступа';
}
