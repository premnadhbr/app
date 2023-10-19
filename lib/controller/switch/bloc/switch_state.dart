class SwitchState {
  final bool switchValue;

  SwitchState({required this.switchValue});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchValue': switchValue,
    };
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      switchValue: map['switchValue'] as bool,
    );
  }
}

final class SwitchInitial extends SwitchState {
  SwitchInitial({required super.switchValue});
}
