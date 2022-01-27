import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/events.dart';
import 'events/i_number_access_event.dart';
import 'number_access_state.dart';

class NumberAccessBloc extends Bloc<INumberAccessEvent, NumberAccessState> {
  NumberAccessBloc() : super(NumberAccessState());

  @override
  Stream<NumberAccessState> mapEventToState(INumberAccessEvent event) async* {
    if (event is ButtonZeroPressedEvent) {
      debugPrint('Нажато 0');
      return;
    }

    if (event is ButtonOnePressedEvent) {
      debugPrint('Нажато 1');
      return;
    }

    if (event is ButtonTwoPressedEvent) {
      debugPrint('Нажато 2');
      return;
    }

    if (event is ButtonThreePressedEvent) {
      debugPrint('Нажато 3');
      return;
    }

    if (event is ButtonFourPressedEvent) {
      debugPrint('Нажато 4');
      return;
    }

    if (event is ButtonFivePressedEvent) {
      debugPrint('Нажато 5');
      return;
    }

    if (event is ButtonSixPressedEvent) {
      debugPrint('Нажато 6');
      return;
    }

    if (event is ButtonSevenPressedEvent) {
      debugPrint('Нажато 7');
      return;
    }

    if (event is ButtonEightPressedEvent) {
      debugPrint('Нажато 8');
      return;
    }

    if (event is ButtonNinePressedEvent) {
      debugPrint('Нажато 9');
      return;
    }

    if (event is ButtonDeletePressedEvent) {
      debugPrint('Нажато Удалить');
      return;
    }
  }
}
