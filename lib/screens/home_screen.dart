import 'package:flutter/material.dart';
import 'package:sample_2/db/functions/db_function.dart';

import 'package:sample_2/widgets/add_students.dart';
import 'package:sample_2/widgets/students_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getallstudents();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListStudents(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddStudentClass();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
