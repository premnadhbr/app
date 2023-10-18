import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(switchValue: true)) {
    on<SwitchOnEvent>(switchOnEvent);
    on<SwitchOffEvent>(switchOffEvent);
  }

  FutureOr<void> switchOnEvent(SwitchOnEvent event, Emitter<SwitchState> emit) {
    emit(SwitchState(switchValue: true));
  }

  FutureOr<void> switchOffEvent(
      SwitchOffEvent event, Emitter<SwitchState> emit) {
    emit(SwitchState(switchValue: false));
  }
}
