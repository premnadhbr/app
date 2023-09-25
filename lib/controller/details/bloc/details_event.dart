// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'details_bloc.dart';

abstract class DetailsEvent {}

class DetailsInitialEvent extends DetailsEvent {}

class EditClickedEvent extends DetailsEvent {}

class UpdateStudentEvent extends DetailsEvent {
  
  String division;
  String bloodgrp;
  String address;
  String number;
  int age;
  String name;
  int index;
  var image;

  UpdateStudentEvent({
    required this.division,
    required this.bloodgrp,
    required this.address,
    required this.number,
    required this.age,
    required this.name,
    required this.index,
    required this.image,
  });
}
