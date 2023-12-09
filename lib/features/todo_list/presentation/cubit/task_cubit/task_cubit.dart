import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_state.dart';
part 'task_cubit.freezed.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState.notDone());

  void taskDone() {
    if (state.isDone) {
      emit(TaskState.notDone());
    } else {
      emit(TaskState.done());
    }
  }
}
