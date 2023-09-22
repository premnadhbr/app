part of 'students_bloc.dart';

abstract class StudentsState {}

abstract class StudentsActionState extends StudentsState {}

class StudentsInitial extends StudentsState {}

class StudentsLoadingState extends StudentsState {}

class StudentsLoadedState extends StudentsState {
  final List<Map<String, dynamic>> students;
  StudentsLoadedState({
    required this.students,
  });
}

class StudentsErrorState extends StudentsState{}

class StudentDeletedActionState extends StudentsActionState {}

class NavigateToStudentsDetailsPageActionState extends StudentsActionState {
  final int index;
  NavigateToStudentsDetailsPageActionState({required this.index});
}