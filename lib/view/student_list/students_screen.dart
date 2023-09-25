import 'package:bloc_mini_project_hive/view/details_student/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/studentLIst/bloc/students_bloc.dart';
import '../../utils/constants/constants.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  late StudentsBloc studentsBloc;
  @override
  void initState() {
    super.initState();
    studentsBloc = StudentsBloc();
    studentsBloc.add(StudentsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: studentsBloc,
      listenWhen: (previous, current) => current is StudentsActionState,
      buildWhen: (previous, current) => current is! StudentsActionState,
      listener: (context, state) {
        if (state is NavigateToStudentsDetailsPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentDetails(index: state.index),
              ));
        } else if (state is StudentDeletedActionState) {
          studentsBloc.add(StudentsInitialEvent());
        }
      },
      builder: (context, state) {
        if (state is StudentsLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is StudentsLoadedState) {
          final successState = state as StudentsLoadedState;
          return Scaffold(
              appBar: AppBar(
                title: Constants.studentListTitle,
              ),
              body: LiquidPullToRefresh(
                color: Colors.transparent,
                onRefresh: () async => studentsBloc.add(StudentsInitialEvent()),
                child: ListView.builder(
                  itemCount: state.students.length,
                  itemBuilder: (context, index) {
                    var img = successState.students[index]["image"];
                    final imageWidget = img != null
                        ? CircleAvatar(
                            backgroundImage: MemoryImage(img),
                          )
                        : const Icon(Icons.person_sharp);
                    return Slidable(
                      endActionPane:
                          ActionPane(motion: const StretchMotion(), children: [
                        SlidableAction(
                          icon: Icons.delete,
                          onPressed: (context) {
                            // studentsBloc.add(DeleteClickedEvent(
                            //     index: successState.students[index]["id"]));
                          },
                        ),
                      ]),
                      child: Padding(
                        padding: Constants.paddingStudentsScreen,
                        child: ListTile(
                          onTap: () => studentsBloc
                              .add(StudentButtonNavigateEvent(index: index)),
                          tileColor: Constants.tiileColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          leading: imageWidget,
                          title:
                              Text("${successState.students[index]["name"]}"),
                          subtitle: Text(
                              "${successState.students[index]["division"]}"),
                          trailing: const Icon(Icons.chevron_right_rounded),
                        ),
                      ),
                    );
                  },
                ),
              ));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
