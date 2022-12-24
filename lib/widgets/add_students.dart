import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_2/db/functions/db_function.dart';
import 'package:sample_2/db/models/data_modal.dart';

class AddStudentClass extends StatefulWidget {
  const AddStudentClass({Key? key}) : super(key: key);

  @override
  State<AddStudentClass> createState() => _AddStudentClassState();
}

class _AddStudentClassState extends State<AddStudentClass> {
  final _nameOfStudent = TextEditingController();
  final _ageOfStudent = TextEditingController();
  final _addressOfStudent = TextEditingController();
  final _phnOfStudent = TextEditingController();
  bool imageAlert = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _photo?.path == null
                    ? const CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage(
                            'assets/pngtree-cartoon-man-avatar-vector-ilustration-png-image_6111064.png'),
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(
                          File(
                            _photo!.path,
                          ),
                        ),
                        radius: 60,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, elevation: 10),
                      onPressed: () {
                        getPhoto();
                      },
                      icon: const Icon(
                        Icons.image_outlined,
                      ),
                      label: const Text(
                        'Add An Image',
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _nameOfStudent,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter student Name',
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 2,
                  controller: _ageOfStudent,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter age',
                    labelText: 'age',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Age';
                    } else {
                      return null;
                    }
                  },
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                TextFormField(
                  controller: _addressOfStudent,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter address',
                    labelText: 'address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Address';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 10,
                  controller: _phnOfStudent,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the number',
                    labelText: 'number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    } else if (value.length < 10) {
                      return 'invalid phone number';
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton.icon(
                    onPressed: (() {
                      if (_formKey.currentState!.validate() && _photo != null) {
                        onStudentAddButtonClick();
                        Navigator.of(context).pop();
                      } else {
                        imageAlert = true;
                      }
                    }),
                    icon: const Icon(Icons.add),
                    label: const Text('Add student'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onStudentAddButtonClick() async {
    final name = _nameOfStudent.text.trim();
    final age = _ageOfStudent.text.trim();
    final address = _addressOfStudent.text.trim();
    final number = _phnOfStudent.text.trim();

    if (_photo!.path.isEmpty ||
        name.isEmpty ||
        age.isEmpty ||
        address.isEmpty ||
        number.isEmpty) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     behavior: SnackBarBehavior.floating,
      //     margin: EdgeInsets.all(20),
      //     content: Text("You need to add everything"),
      //   ),
      // );
      return;
    }
    // else if (_photo!.path.isEmpty) {
    //   _photo = File(
    //       'assets/pngtree-cartoon-man-avatar-vector-ilustration-png-image_6111064.png');
    //   // _photo.path = Image.asset(
    //   //     'assets/pngtree-cartoon-man-avatar-vector-ilustration-png-image_6111064.png');
    //   // setState(
    //   //   () {
    //   //     _photo = photodefault;
    //   //   },
    //   // );
    // }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(20),
          content: Text("Student Added Successfully"),
        ),
      );
    }
    stdout.write('$name $age $number $address');
    final student = StudentModel(
      name: name,
      age: age,
      phnNumber: number,
      address: address,
      photo: _photo!.path,
    );
    addStudent(student);
  }

  File? _photo;
  Future<void> getPhoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) {
      return;
      // final photodefault = Image.asset(
      //     'assets/pngtree-cartoon-man-avatar-vector-ilustration-png-image_6111064.png');

      // setState(
      //   () {
      //     _photo = photodefault;
      //   },
      // );
    } else {
      final photoTemp = File(photo.path);
      setState(
        () {
          _photo = photoTemp;
        },
      );
    }
  }
}
