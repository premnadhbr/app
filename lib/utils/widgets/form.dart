// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:bloc_mini_project_hive/controller/addStudent/bloc/add_student_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import 'package:bloc_mini_project_hive/utils/constants/constants.dart';

// ignore: must_be_immutable
class CustomFormWidget extends StatelessWidget {
  var bloc;
  var image;
  bool option;
  String? name;
  int? age;
  String? address;
  String? contact;
  String? bloodgroup;
  String? batch;
  int? index;
  CustomFormWidget({
    Key? key,
    required this.bloc,
    this.image,
    required this.option,
    this.name,
    this.age,
    this.address,
    this.contact,
    this.bloodgroup,
    this.batch,
    this.index,
  }) : super(key: key);

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController ageEditingController = TextEditingController();
  final TextEditingController numberEditingController = TextEditingController();
  final TextEditingController addressEditingController =
      TextEditingController();
  final TextEditingController bloodEditingController = TextEditingController();
  final TextEditingController stdEditingController = TextEditingController();

  var myfile;
  late Uint8List imagebytes;
  var compressed;

  @override
  Widget build(BuildContext context) {
    nameEditingController.text = name ?? "";
    ageEditingController.text = age?.toString() ?? "";
    numberEditingController.text = contact ?? "";
    addressEditingController.text = address ?? "";
    bloodEditingController.text = bloodgroup ?? "";
    stdEditingController.text = batch ?? "";
    return Form(
      key: _formkey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
            controller: nameEditingController,
            decoration: InputDecoration(
              hintText: Constants.nameHint,
              label: Text(Constants.nameString),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            maxLength: 2,
            decoration: InputDecoration(
              hintText: Constants.ageHint,
              label: Text(Constants.ageString),
              border: OutlineInputBorder(),
            ),
            controller: ageEditingController,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: numberEditingController,
            decoration: InputDecoration(
                hintText: Constants.numberHint,
                label: Text(Constants.contactString),
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: addressEditingController,
            decoration: InputDecoration(
              hintText: Constants.addressHint,
              label: Text(Constants.addressString),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: bloodEditingController,
            decoration: InputDecoration(
                hintText: Constants.bloodHint,
                label: Text(Constants.bloodString),
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: stdEditingController,
            decoration: InputDecoration(
              hintText: Constants.divisionHint,
              label: Text(Constants.divisionString),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: imagePick,
            child: Icon(Icons.image_search_outlined),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: option ? add : update,
              child: option
                  ? Constants.addButtonText
                  : Constants.updateButtonText),
        ],
      ),
    );
  }

  void add() {
    bloc.add(ClickedEvent(
      division: stdEditingController.text,
      bloodgrp: bloodEditingController.text,
      address: addressEditingController.text,
      number: numberEditingController.text,
      age: int.parse(ageEditingController.text),
      name: nameEditingController.text,
      image: compressed,
    ));
    _formkey.currentState!.reset();
  }

  void update() {
    bloc.add();
  }

  imagePick() async {
    myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    imagebytes = await myfile!.readAsBytes();
    compressed =
        await FlutterImageCompress.compressWithList(imagebytes, quality: 85);
    print(compressed);
  }
}
