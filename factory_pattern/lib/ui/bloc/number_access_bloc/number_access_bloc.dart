import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/events.dart';
import 'events/i_number_access_event.dart';
import 'number_access_state.dart';

class NumberAccessBloc extends Bloc<INumberAccessEvent, NumberAccessState> {
  NumberAccessBloc() : super(NumberAccessState());

  @override
  Stream<NumberAccessState> mapEventToState(INumberAccessEvent event) async* {
    if (event is ButtonZeroPressedEvent) {
      print('Нажато 0');
      return;
    }

    if (event is ButtonTwoPressedEvent) {
      print('Нажато 2');
      return;
    }

    if (event is ButtonDeletePressedEvent) {
      print('Нажато Удалить');
      return;
    }
  }
}
