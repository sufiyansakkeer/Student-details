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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameOfStudent,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter student Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' Name is Required';
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
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' Age is Required';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _addressOfStudent,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' Address is Required';
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
                      if (_formKey.currentState!.validate()) {
                        onStudentAddButtonClick();
                        Navigator.of(context).pop();
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

    if (name.isEmpty || age.isEmpty || address.isEmpty || number.isEmpty) {
      return;
    } else {
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
    );
    addStudent(student);
  }
}
