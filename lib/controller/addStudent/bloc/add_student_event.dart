// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_student_bloc.dart';

abstract class AddStudentEvent {}

class AddInitialEvent extends AddStudentEvent {}

class ClickedEvent extends AddInitialEvent {
  String division;
  String bloodgrp;
  String address;
  String number;
  int age;
  String name;
  var image;

  ClickedEvent({
    required this.division,
    required this.bloodgrp,
    required this.address,
    required this.number,
    required this.age,
    required this.name,
    required this.image,
  });
}
