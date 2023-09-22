import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_mini_project_hive/model/student_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:meta/meta.dart';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsInitialEvent>(detailsInitialEvent);
  }

  FutureOr<void> detailsInitialEvent(
      DetailsInitialEvent event, Emitter<DetailsState> emit) async {
    emit(DetailsLoadingState());
    try {
      final dataList = await StudentDatabase.getAllStudents();
      emit(DetailsLoadedsuccessState(students: dataList));
    } catch (e) {
      emit(DetailsErrorState());
    }
  }
}
