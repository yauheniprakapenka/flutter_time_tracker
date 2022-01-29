import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/events.dart';
import 'number_panel_state.dart';

class NumberPanelBloc extends Bloc<INumberPanelEvent, NumberPanelState> {
  NumberPanelBloc() : super(const NumberPanelState(currentPassword: ''));

  @override
  Stream<NumberPanelState> mapEventToState(INumberPanelEvent event) async* {
    if (event is PasswordButtonPressedEvent) {
      print('нажато ${event.pressedValue}');
      return;
    }

    if (event is DeleteButtonPressedEvent) {
      print('Нажать кнопка удаления');
      return;
    }
  }
}
