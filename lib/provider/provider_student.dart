import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_2/db/models/data_modal.dart';

class ProviderStudent with ChangeNotifier {
  List<StudentModel> studentDetails = [];
  final String studentDbName = 'student_db';
  //* adding student
  Future<void> addStudent(StudentModel student) async {
    final Box<StudentModel> studentDB =
        await Hive.openBox<StudentModel>(studentDbName);
    final id = await studentDB.add(student);
    student.id = id;
    studentDetails.add(student);
    notifyListeners();
    studentDetails = studentDB.values.toList();
    notifyListeners();

    //here we use notifylisteners because to notify the list without this the list widget won't work
  }

//* getting all the data
  Future<void> getallstudents() async {
    final studentDB = await Hive.openBox<StudentModel>(studentDbName);
    studentDetails = studentDB.values.toList();
    notifyListeners();
  }

  Future<void> deleteStudent(int id) async {
    final studentDB = await Hive.openBox<StudentModel>(studentDbName);
    await studentDB.deleteAt(id);
    notifyListeners();
    getallstudents();
  }

  Future<void> editList(int id, StudentModel value) async {
    final studentDatabase = await Hive.openBox<StudentModel>('student_db');
    studentDatabase.putAt(id, value);
    notifyListeners();
    getallstudents();
  }
}
