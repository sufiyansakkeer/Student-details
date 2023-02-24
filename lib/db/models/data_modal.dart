//here we are writing the model of student entry, so when we create an object for this
//class,we can give the parameters name and age through argument in the constructor

import 'package:hive_flutter/hive_flutter.dart';
part 'data_modal.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String address;

  @HiveField(4)
  final String phnNumber;

  StudentModel(
      {required this.name,
      required this.age,
      required this.address,
      required this.phnNumber,
      this.id});
}
