import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_mini_project_hive/controller/details/bloc/details_bloc.dart';
import 'package:bloc_mini_project_hive/utils/constants/constants.dart';
import 'package:bloc_mini_project_hive/utils/widgets/form.dart';

class StudentDetails extends StatefulWidget {
  final int index;
  const StudentDetails({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  bool enabled = false;
  DetailsBloc detailsBloc = DetailsBloc();
  @override
  void initState() {
    detailsBloc.add(DetailsInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(
      bloc: detailsBloc,
      buildWhen: (previous, current) => current is! DetailsActionstate,
      listenWhen: (previous, current) => current is DetailsActionstate,
      listener: (context, state) {
        if (state is EditEnabledState) {
          enabled = !enabled;
          detailsBloc.add(DetailsInitialEvent());
        } else if (state is DetailsUpdatedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Student Detail Updated')));
        }
      },
      builder: (context, state) {
        if (state is DetailsLoadingState) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is DetailsLoadedsuccessState) {
          var db = state.students;
          var img = db[widget.index]["image"];

          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      detailsBloc.add(EditClickedEvent());
                    },
                    icon: Constants.editIcon)
              ],
            ),
            body: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: Constants.detailsContainerHeight,
                        color: Constants.themeColor,
                      ),
                      Container(
                        margin: Constants.detailsPadding,
                        width: double.infinity,
                        child: CustomFormWidget(
                          enabled: enabled,
                          bloc: detailsBloc,
                          option: false,
                          address: db[widget.index]["address"],
                          age: db[widget.index]["age"],
                          batch: db[widget.index]["division"],
                          bloodgroup: db[widget.index]["bloodgroup"],
                          contact: db[widget.index]["contact"],
                          image: db[widget.index]["image"],
                          index: db[widget.index]["id"],
                          name: db[widget.index]["name"],
                        ),
                      ),
                      Constants.heightSized,
                    ],
                  ),
                  Positioned(
                    top: Constants.detailsContainerHeight / 2.1,
                    child: Constants.detailsCircleAvatarBg,
                  ),
                  Positioned(
                    top: Constants.detailsContainerHeight / 2,
                    child: CircleAvatar(
                      radius: Constants.detailsContainerHeight / 2,
                      backgroundImage: MemoryImage(img),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }
      },
    );
  }
}
