import 'dart:io';

import 'package:flutter/material.dart';

import 'package:sample_2/db/functions/db_function.dart';
import 'package:sample_2/db/models/data_modal.dart';

class EditStudent extends StatelessWidget {
  final String name;
  final String age;
  final String address;
  final String number;

  final int index;

  EditStudent({
    super.key,
    required this.name,
    required this.age,
    required this.address,
    required this.number,
    required this.index,
  });

  TextEditingController _nameOfStudent = TextEditingController();

  TextEditingController _ageOfStudent = TextEditingController();

  TextEditingController _addressOfStudent = TextEditingController();

  TextEditingController _phnOfStudent = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _nameOfStudent = TextEditingController(text: name);
    _ageOfStudent = TextEditingController(text: age);
    _addressOfStudent = TextEditingController(text: address);
    _phnOfStudent = TextEditingController(text: number);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const Text(
                      'Edit student details',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _nameOfStudent,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '',
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
                        hintText: 'Enter your age',
                        labelText: 'Age',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Age';
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
                        hintText: 'Enter your address',
                        labelText: 'Address',
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
                        hintText: 'Enter your phn',
                        labelText: 'Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Number';
                        } else if (value.length < 10) {
                          return 'invalid phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              onEditSaveButton(context);
                              Navigator.of(context).pop();
                            }
                          },
                          icon: const Icon(Icons.check),
                          label: const Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Future<void> onEditSaveButton(context) async {
    final studentmodel = StudentModel(
      name: _nameOfStudent.text,
      age: _ageOfStudent.text,
      phnNumber: _phnOfStudent.text,
      address: _addressOfStudent.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(30),
        backgroundColor: Colors.blueGrey,
        content: Text(
          'Saved',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
    editList(index, studentmodel);
  }
}
