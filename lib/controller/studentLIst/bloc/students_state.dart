// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class StudentsErrorState extends StudentsState {}

class NavigateToStudentsDetailsPageActionState extends StudentsActionState {
  final int index;
  NavigateToStudentsDetailsPageActionState({
    required this.index,
  });
}


// class StudentDeletedActionState extends StudentsActionState {}

// class NavigateToStudentsDetailsPageActionState extends StudentsActionState {
//   final int index;
//   NavigateToStudentsDetailsPageActionState({required this.index});
// }