import 'package:bloc_mini_project_hive/utils/constants/constants.dart';
import 'package:bloc_mini_project_hive/utils/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/addStudent/bloc/add_student_bloc.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({super.key});
  final AddStudentBloc addBloc = AddStudentBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddStudentBloc, AddStudentState>(
      bloc: addBloc,
      buildWhen: (previous, current) => current is! AddStudentAddedState,
      listenWhen: (previous, current) => current is AddStudentAddedState,
      listener: (context, state) {
        if (state is AddStudentAddedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(Constants.addstudentSnackbar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Constants.addAppBarTitle,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: Constants.addStudentPadding,
              child: Column(
                children: [
                  Constants.addFormTitle,
                  CustomFormWidget(
                    bloc: addBloc,
                    option: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
