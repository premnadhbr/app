import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/student_database.dart';
part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  AddStudentBloc() : super(AddStudentInitial()) {
    on<ClickedEvent>(clickedEvent);
  }

  FutureOr<void> clickedEvent(
      ClickedEvent event, Emitter<AddStudentState> emit) async {
    try {
      String name = event.name;
      int age = event.age;
      String bloodgroup = event.bloodgrp;
      String contact = event.number;
      String division = event.division;
      String address = event.address;
      var image = event.image;

      await StudentDatabase.insertStudent(
          name: name,
          age: age,
          contact: contact,
          bloodgroup: bloodgroup,
          address: address,
          division: division,
          imageBytes: image);

      emit(AddStudentAddedState());
    } catch (e) {
      log(e.toString());
    }
  }
}
