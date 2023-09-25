import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_mini_project_hive/model/student_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:meta/meta.dart';
import '../../../utils/constants/constants.dart';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsInitialEvent>(detailsInitialEvent);
    on<EditClickedEvent>(editClickedEvent);
    on<UpdateStudentEvent>(updateStudentEvent);
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

  FutureOr<void> editClickedEvent(
      EditClickedEvent event, Emitter<DetailsState> emit) {
    emit(EditEnabledState());
  }

  FutureOr<void> updateStudentEvent(
      UpdateStudentEvent event, Emitter<DetailsState> emit) async {
    try {
      final Map<String, dynamic> data = {
        Constants.nameString: event.name,
        Constants.ageString: event.age,
        Constants.contactString: event.number,
        Constants.bloodString: event.bloodgrp,
        Constants.addressString: event.address,
        Constants.divisionString: event.division,
        Constants.imageString: event.image,
      };

      await StudentDatabase.updateData(event.index, data);
      emit(DetailsUpdatedState());
    } catch (e) {
      print(e);
    }
  }
}
