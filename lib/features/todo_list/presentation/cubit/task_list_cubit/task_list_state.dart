part of 'task_list_cubit.dart';

@freezed
class TaskListState with _$TaskListState {
  const TaskListState._();

  const factory TaskListState({
    @Default(true) bool isLoading,
    @Default([]) List<Task> items,
    @Default(0) int dateFilterCounter,
    @Default(0) int priorityFilterCounter,
  }) = _TaskListState;

  factory TaskListState.loading() {
    return const _TaskListState(isLoading: true, items: []);
  }

  factory TaskListState.data(List<Task> items) {
    return _TaskListState(isLoading: false, items: items);
  }

  factory TaskListState.sortedByDate(List<Task> items, int counter) {
    return _TaskListState(
        isLoading: false,
        items: items,
        dateFilterCounter: counter,
        priorityFilterCounter: 0);
  }

  factory TaskListState.sortedBy(List<Task> items, int counter) {
    return _TaskListState(
        isLoading: false,
        items: items,
        dateFilterCounter: 0,
        priorityFilterCounter: counter);
  }
}
