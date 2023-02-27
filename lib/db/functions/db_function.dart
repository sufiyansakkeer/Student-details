import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sample_2/db/models/data_modal.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  // studentListNotifier.value.add(value);
  //here student list notifier is the class of value notifier and value that are adding is list type
  // print(value.toString());

  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final id = await studentDB.add(value);
  value.id = id;
  // studentListNotifier.value.add(value);
  // studentListNotifier.notifyListeners();
  //here we use notifylisteners because to notify the list without this the list widget won't work
}

Future<List<StudentModel>> getallstudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  return studentDB.values.toList();
  // studentListNotifier.value.clear();

  // studentListNotifier.notifyListeners();
  // studentListNotifier.value.addAll(studentDB.values);
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  await studentDB.deleteAt(id);
  getallstudents();
}

Future<void> editList(int id, StudentModel value) async {
  final studentDatabase = await Hive.openBox<StudentModel>('student_db');
  studentDatabase.putAt(id, value);
  getallstudents();
}
