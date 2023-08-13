import 'package:bloc/bloc.dart';
import 'package:done/features/todo_list/data/models/task.dart';
import 'package:done/features/todo_list/data/repository/todo_list_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_list_cubit.freezed.dart';
part 'task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  TaskListCubit(int? currentContextId) : super(TaskListState.loading()) {
    fetchTasks(currentContextId);
  }

  final repo = TodoListRepository();

  void fetchTasks(int? currentContextId) async {
    emit(TaskListState.loading());
    var result = await repo.getTasks(currentContextId);
    emit(
      TaskListState.data(
        result,
      ),
    );
  }

  void addNewTask(Task task, int? currentContextId) {
    repo.addTask(task);
    fetchTasks(currentContextId);
  }

  void taskIsTapped(Task task) {
    repo.toggleTask(task);
  }

  void sortTasksByPriority(int? currentContextId) async {
    emit(
      state.copyWith(isLoading: true),
    );
    var result = await repo.getTasks(currentContextId);
    var counter = state.priorityFilterCounter;
    counter++;

    if (counter == 3) {
      counter = 0;
    } else {
      result.sort(priorityComparator);
      if (counter == 2) {
        result = result.reversed.toList();
      }
    }

    emit(
      state.copyWith(
        isLoading: false,
        items: result,
        priorityFilterCounter: counter,
      ),
    );
  }

  void sortTasksByDate(int? currentContextId) async {
    emit(
      state.copyWith(isLoading: true),
    );
    var result = await repo.getTasks(currentContextId);
    var counter = state.dateFilterCounter;
    counter++;

    if (counter == 3) {
      counter = 0;
    } else {
      result.sort(dateComparator);
      if (counter == 2) {
        result = result.reversed.toList();
      }
    }

    emit(
      state.copyWith(
        isLoading: false,
        items: result,
        dateFilterCounter: counter,
      ),
    );
  }

  int getMaxId() {
    return state.items
            .reduce((curr, next) => curr.id > next.id ? curr : next)
            .id +
        1;
  }

  int priorityComparator(Task a, Task b) {
    final propertyA = a.priority != null ? a.priority!.index : 0;
    final propertyB = b.priority != null ? b.priority!.index : 0;
    if (propertyA < propertyB) {
      return -1;
    } else if (propertyA > propertyB) {
      return 1;
    } else {
      return 0;
    }
  }

  int dateComparator(Task a, Task b) {
    final propertyA = a.date != null ? a.date! : DateTime.now();
    final propertyB = b.date != null ? b.date! : DateTime.now();
    if (propertyA.compareTo(propertyB) < 0) {
      return -1;
    } else if (propertyA.compareTo(propertyB) > 0) {
      return 1;
    } else {
      return 0;
    }
  }
}
