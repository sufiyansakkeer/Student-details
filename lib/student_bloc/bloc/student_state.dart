part of 'student_bloc.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}

class ReadState extends StudentState {
  final List<StudentModel> studentList;

  ReadState({required this.studentList});
}
