import 'package:flutter/material.dart';
import 'package:sample_2/db/functions/db_function.dart';

import 'package:sample_2/widgets/add_students.dart';
import 'package:sample_2/widgets/search_screen.dart';
import 'package:sample_2/widgets/students_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getallstudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Open search',
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchWidget(),
              );
            },
          ),
        ],
      ),
      body: const ListStudents(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddStudentClass();
              },
            ),
          );
        },
        tooltip: 'Add students',
        child: const Icon(Icons.add),
      ),
    );
  }
}
