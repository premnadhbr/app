import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_mini_project_hive/model/student_database.dart';
import 'package:meta/meta.dart';
part 'students_event.dart';
part 'students_state.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  StudentsBloc() : super(StudentsInitial()) {
    on<StudentsInitialEvent>(studentsInitialEvent);
  }

  FutureOr<void> studentsInitialEvent(
      StudentsInitialEvent event, Emitter<StudentsState> emit) async {
    emit(StudentsLoadingState());
    await Future.delayed(Duration(seconds: 1));
    try {
      final dataList = await StudentDatabase.getAllStudents();
      emit(StudentsLoadedState(students: dataList));
    } catch (e) {
      emit(StudentsErrorState());
    }
  }
}
