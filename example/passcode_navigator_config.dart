import 'package:flutter/material.dart';
import 'package:passcode_navigator/passcode_navigator.dart';

import 'facebook_color_impl.dart';
import 'facebook_localization_impl.dart';

final passcodeNavigatorConfig = PasscodeNavigatorConfig(
  passcodeFlow: PasscodeFlow.changePasscode,
  passcodeLength: 4,
  localization: FacebookLocalizationImpl(),
  color: FacebookColorImpl(),
  logo: Image.network(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/488px-Apple_logo_black.svg.png'),
);
