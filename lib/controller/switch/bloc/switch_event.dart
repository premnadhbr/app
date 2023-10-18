part of 'switch_bloc.dart';

@immutable
sealed class SwitchEvent {}

class SwitchOnEvent extends SwitchEvent{}

class SwitchOffEvent extends SwitchEvent{}