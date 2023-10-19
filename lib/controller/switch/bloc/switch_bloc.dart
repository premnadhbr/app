import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_mini_project_hive/controller/switch/bloc/switch_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
part 'switch_event.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(switchValue: false)) {
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

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toMap();
  }
}
