import 'package:bloc_mini_project_hive/controller/home/bloc/home_bloc.dart';
import 'package:bloc_mini_project_hive/controller/switch/bloc/switch_bloc.dart';
import 'package:bloc_mini_project_hive/utils/constants/constants.dart';
import 'package:bloc_mini_project_hive/utils/services/notifications.dart';
import 'package:bloc_mini_project_hive/view/add_student/addScreen.dart';
import 'package:bloc_mini_project_hive/view/home/home_widget/cardmenu.dart';
import 'package:bloc_mini_project_hive/view/student_list/students_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../controller/switch/bloc/switch_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, current) => current is! HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToAddingPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddStudentPage(),
              ));
        } else if (state is HomeNavigateToStudentListPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StudentsPage(),
              ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Constants.homeTitleString,
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BlocBuilder<SwitchBloc, SwitchState>(
                        builder: (context, state) {
                          return Switch(
                            value: state.switchValue,
                            onChanged: (value) {
                              value
                                  ? context
                                      .read<SwitchBloc>()
                                      .add(SwitchOnEvent())
                                  : context
                                      .read<SwitchBloc>()
                                      .add(SwitchOffEvent());
                            },
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardWidget(
                      event: HomeNavigateToAddEvent(),
                      homeBloc: homeBloc,
                      path: Constants.addCardmenuImageLogo,
                      buttonText: Constants.addStudentString),
                  CardWidget(
                      event: HomeNavigateToStudentListEvent(),
                      homeBloc: homeBloc,
                      path: Constants.viewCardmenuImageLogo,
                      buttonText: Constants.viewStudentString)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
