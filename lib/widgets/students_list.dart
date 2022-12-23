import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample_2/db/models/data_modal.dart';
import 'package:sample_2/widgets/display_student_screen.dart';
import 'package:sample_2/widgets/edit_student.dart';

import '../db/functions/db_function.dart';

class ListStudents extends StatefulWidget {
  const ListStudents({super.key});

  @override
  State<ListStudents> createState() => _ListStudentsState();
}

class _ListStudentsState extends State<ListStudents> {
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
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: FileImage(
                      File(data.photo),
                    ),
                  ),
                  title: Text(data.name),
                  // subtitle: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(data.age),
                  //     Text(data.phnNumber),
                  //     Text(data.address),
                  //   ],
                  // ),
                  // trailing: Row(
                  //   children: <Widget>[(
                  //     child: IconButton(
                  //         onPressed: (() {
                  //           // if (data.id != null) {
                  //           //   deleteStudent(index);
                  //           // } else {
                  //           //   print('there is no student data');
                  //           // }
                  //           deleteStudent(index);
                  //         }),
                  //         icon: const Icon(
                  //           Icons.delete_outline,
                  //           color: Colors.red,
                  //         )),
                  //   ),]
                  // ),
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
                                    image: data.photo,
                                    photo: '');
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
                          // if (data.id != null) {
                          //   deleteStudent(index);
                          // } else {
                          //   print('there is no student data');
                          // }
                          deleteStudent(index);
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return DisplayStudent(
                        name: data.name,
                        age: data.age,
                        address: data.address,
                        number: data.phnNumber,
                        index: index,
                        photo: data.photo,
                      );
                    })));
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
}
