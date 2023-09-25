// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'students_bloc.dart';

abstract class StudentsEvent {}

class StudentsInitialEvent extends StudentsEvent {}

class StudentButtonNavigateEvent extends StudentsEvent {
  int index;

  StudentButtonNavigateEvent({required this.index});
}

class DeleteClickedEvent extends StudentsEvent {
  int index;
  DeleteClickedEvent({required this.index});
}
