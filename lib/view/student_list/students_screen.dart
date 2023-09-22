import 'package:flutter/material.dart';
import 'package:bloc_mini_project_hive/controller/studentLIst/bloc/students_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StudentsScreen extends StatefulWidget {
  const StudentsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  final StudentsBloc studentsBloc = StudentsBloc();
  @override
  void initState() {
    super.initState();
    studentsBloc.add(StudentsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentsBloc, StudentsState>(
      bloc: studentsBloc,
      // buildWhen: (previous, current) => ,
      // listenWhen: (previous, current) => ,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold();
      },
    );
  }
}
