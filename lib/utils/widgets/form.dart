// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc_mini_project_hive/controller/addStudent/bloc/add_student_bloc.dart';
import 'package:bloc_mini_project_hive/utils/constants/constants.dart';
import '../../controller/details/bloc/details_bloc.dart';

// ignore: must_be_immutable
class CustomFormWidget extends StatelessWidget {
  var bloc;
  var image;
  bool option;
  bool enabled;
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
    required this.enabled,
    this.name,
    this.age,
    this.address,
    this.contact,
    this.bloodgroup,
    this.batch,
    this.index,
  }) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController ageEditingController = TextEditingController();
  final TextEditingController numberEditingController = TextEditingController();
  final TextEditingController addressEditingController =
      TextEditingController();
  final TextEditingController bloodEditingController = TextEditingController();
  final TextEditingController stdEditingController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var myfile;
  late Uint8List imagebytes;
  // ignore: prefer_typing_uninitialized_variables
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
            enabled: enabled,
            controller: nameEditingController,
            decoration: InputDecoration(
              hintText: Constants.nameHint,
              label: Text(Constants.nameString),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: enabled,
            maxLength: 2,
            decoration: InputDecoration(
              hintText: Constants.ageHint,
              label: Text(Constants.ageString),
              border: const OutlineInputBorder(),
            ),
            controller: ageEditingController,
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: enabled,
            controller: numberEditingController,
            decoration: InputDecoration(
                hintText: Constants.numberHint,
                label: Text(Constants.contactString),
                border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: enabled,
            controller: addressEditingController,
            decoration: InputDecoration(
              hintText: Constants.addressHint,
              label: Text(Constants.addressString),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: enabled,
            controller: bloodEditingController,
            decoration: InputDecoration(
                hintText: Constants.bloodHint,
                label: Text(Constants.bloodString),
                border: const OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: enabled,
            controller: stdEditingController,
            decoration: InputDecoration(
              hintText: Constants.divisionHint,
              label: Text(Constants.divisionString),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: imagePick,
            child: const Icon(Icons.image_search_outlined),
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

  update() {
    bloc.add(UpdateStudentEvent(
      index: index!,
      name: nameEditingController.text,
      address: addressEditingController.text,
      age: int.parse(ageEditingController.text),
      bloodgrp: bloodEditingController.text,
      number: numberEditingController.text,
      division: stdEditingController.text,
      image: compressed ?? image,
    ));
  }

  imagePick() async {
    myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    imagebytes = await myfile!.readAsBytes();
    compressed =
        await FlutterImageCompress.compressWithList(imagebytes, quality: 85);
    print(compressed);
  }
}
