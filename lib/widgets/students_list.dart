import 'dart:io';

import 'package:flutter/material.dart';

import 'package:sample_2/widgets/display_student_screen.dart';
import 'package:sample_2/widgets/edit_student.dart';

import '../db/functions/db_function.dart';

class ListStudents extends StatelessWidget {
  const ListStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (ctx, studentModel, Widget? child) {
        return ListView.separated(
            itemBuilder: ((context, index) {
              final data = studentModel[index];
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  title: Text(data.name),
                  trailing: Wrap(
                    spacing: 12, // space between two icons
                    children: <Widget>[
                      IconButton(
                        onPressed: (() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) {
                                return EditStudent(
                                  name: data.name,
                                  age: data.age,
                                  address: data.address,
                                  number: data.phnNumber,
                                  index: index,
                                );
                              }),
                            ),
                          );
                          // EditStudent();
                        }),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        tooltip: 'Edit',
                      ),

                      IconButton(
                        onPressed: (() {
                          showDialog(
                            context: context,
                            builder: ((context) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: AlertDialog(
                                  title: const Text(
                                    'Alert!',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  content: const Text(
                                    "Do you want to delete this student",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: (() {
                                        popoutfuction(context);
                                        deleteStudent(index);
                                      }),
                                      child: const Text('Yes'),
                                    ),
                                    TextButton(
                                        onPressed: (() {
                                          popoutfuction(context);
                                        }),
                                        child: const Text('No'))
                                  ],
                                ),
                              );
                            }),
                          );
                        }),
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        tooltip: 'Delete',
                      ),
                      // icon-2
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return DisplayStudent(
                            name: data.name,
                            age: data.age,
                            address: data.address,
                            number: data.phnNumber,
                            index: index,
                          );
                        }),
                      ),
                    );
                  },
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return const Divider();
            }),
            itemCount: studentModel.length);
      },
    );
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
