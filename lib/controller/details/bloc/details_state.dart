// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'details_bloc.dart';

abstract class DetailsState {}

class DetailsActionstate extends DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsLoadedsuccessState extends DetailsState {
  final List<Map<String, dynamic>> students;
  DetailsLoadedsuccessState({
    required this.students,
  });
}

class DetailsBackState extends DetailsActionstate{}

class DetailsUpdatedState extends DetailsActionstate {}

class DetailsErrorState extends DetailsState {}

class EditEnabledState extends DetailsActionstate {}
