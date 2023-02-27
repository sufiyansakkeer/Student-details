part of 'student_bloc.dart';

@immutable
abstract class StudentEvent extends Equatable {}

class AddStudent extends StudentEvent {
  final StudentModel studentModel;

  AddStudent({required this.studentModel});

  @override
  List<Object?> get props => [];
}

class EditStudentEvent extends StudentEvent {
  final int id;
  final StudentModel studentModel;

  EditStudentEvent({required this.id, required this.studentModel});
  @override
  List<Object?> get props => [];
}
