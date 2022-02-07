import 'package:passcode/src/ui/shared/localization/i_localization.dart';

class FacebookLocalizationImpl implements ILocalization {
  @override
  String get createPasscode => 'Придумайте ключ доступа';

  @override
  String get repeatPasscode => 'Повторите ключ доступа';

  @override
  String get enterCurrentPasscode => 'Введите текущий ключ доступа';

  @override
  String get loginWithNameAndPassword => 'Войти по логину и паролю';

  @override
  String get passcodeEnteredIncorrectly => 'Неверно введен ключ доступа';

  @override
  String get cancel => 'Отмена';
}
