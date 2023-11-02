// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState {}

class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeNavigateToAddingPageActionState extends HomeActionState {}

class HomeNavigateToStudentListPageActionState extends HomeActionState {}

class HomeLocationGetstate extends HomeActionState {
  final String current;
  HomeLocationGetstate({
    required this.current,
  });
}

class HomeLoaddedstate extends HomeState{}