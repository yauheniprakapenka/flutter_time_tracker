import '../../bloc/number_access_bloc/events/events.dart';
import '../../components/number_access_buttons/decorators/button_padding_decorator.dart';
import '../../components/number_access_buttons/widgets/password_button.dart';

final fourButton = ButtonPaddingDecorator(
  child: PasswordButton(
    title: '4',
    numberAccessEvent: ButtonFourPressedEvent(),
  ),
);
