// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      // buildWhen:(previous, current) => ,
      // listenWhen: (previous, current) => ,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DetailsLoadingState) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is DetailsLoadedsuccessState) {
          var db = state.students;
          var img = db[widget.index][Constants.imageString];

          return Scaffold(
            appBar: AppBar(
              actions: [IconButton(onPressed: () {}, icon: Constants.editIcon)],
            ),
            body: SingleChildScrollView(
              child: Stack(
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
                          bloc: detailsBloc,
                          option: false,
                          address: db[widget.index][Constants.addressString],
                          age: db[widget.index][Constants.ageString],
                          batch: db[widget.index][Constants.divisionString],
                          bloodgroup: db[widget.index][Constants.bloodString],
                          contact: db[widget.index][Constants.contactString],
                          image: db[widget.index][Constants.imageString],
                          index: db[widget.index][Constants.idString],
                          name: db[widget.index][Constants.imageString],
                        ),
                      ),
                      Constants.heightSized,
                    ],
                  ),
                  Positioned(
                      top: Constants.detailsContainerHeight / 2,
                      child: Constants.detailsCircleAvatarBg),
                  Positioned(
                      child: CircleAvatar(
                    radius: Constants.detailsContainerHeight / 2,
                    backgroundImage: MemoryImage(img),
                  ))
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
