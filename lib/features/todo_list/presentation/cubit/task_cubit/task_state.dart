part of 'task_cubit.dart';

@freezed
class TaskState with _$TaskState {
  const TaskState._();

  const factory TaskState({
    @Default(true) bool isDone,
  }) = _TaskState;

  factory TaskState.done() {
    return const _TaskState(isDone: true);
  }

  factory TaskState.notDone() {
    return const _TaskState(isDone: false);
  }
}
