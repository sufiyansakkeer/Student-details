import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample_2/db/functions/db_function.dart';
import 'package:sample_2/db/models/data_modal.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentInitial()) {
    on<AddStudent>((event, emit) async {
      log(event.studentModel.name.toString());
      await addStudent(event.studentModel);
      final result = await getallstudents();
      emit(ReadState(studentList: result));
    });
    on<EditStudentEvent>((event, emit) async {
      await editList(event.id, event.studentModel);
      final result = await getallstudents();
      emit(ReadState(studentList: result));
    });
  }
}
