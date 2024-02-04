import 'package:done/core/presentation/widgets/app_card_widget.dart';
import 'package:done/core/util/date_utils.dart';
import 'package:done/features/todo_list/data/models/task.dart';
import 'package:done/features/todo_list/presentation/cubit/task_cubit/task_cubit.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskTileForAllContexts extends StatelessWidget {
  const TaskTileForAllContexts({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return AppCardWidgetAllContexts(
      currentUserContext: context.watch<UserContextCubit>().findContext(
            task.userContextId ?? 0,
          ),
      borderColor: _getImportantColor(context),
      cardBody: _TaskTileBodyForAllContexts(task: task),
    );
  }

  Color? _getImportantColor(BuildContext context) {
    switch (task.priority) {
      case TaskPriority.low:
        return Colors.green;
      case TaskPriority.medium:
        return Colors.yellow;
      case TaskPriority.high:
        return Colors.red;
      default:
        return null;
    }
  }
}

class TaskTileForSelectedContext extends StatelessWidget {
  const TaskTileForSelectedContext({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return AppCardWidgetForSelectedContext(
      borderColor: _getImportantColor(context),
      currentUserContext: context.watch<UserContextCubit>().findContext(
            task.userContextId ?? 0,
          ),
      cardBody: _TaskTileBodyForSelectedContext(task: task),
    );
  }

  Color? _getImportantColor(BuildContext context) {
    switch (task.priority) {
      case TaskPriority.low:
        return Colors.green;
      case TaskPriority.medium:
        return Colors.yellow;
      case TaskPriority.high:
        return Colors.red;
      default:
        return null;
    }
  }
}

class _TaskTileBodyForAllContexts extends StatelessWidget {
  const _TaskTileBodyForAllContexts({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.title ?? '',
                    style: TextStyle(
                      decoration: state.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 16,
                    ),
                  ),
                  task.date != null
                      ? Text(
                          DateUtility.getDateText(task.date!),
                          style: TextStyle(
                            color: Colors.black,
                            decoration: state.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontSize: 12,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const Spacer(),
              task.priority != null ? _importantTask() : const SizedBox(),
            ],
          );
        },
      ),
    );
  }

  Widget _importantTask() {
    switch (task.priority) {
      case TaskPriority.low:
        return const Center(
          child: Text(
            '!',
            style: TextStyle(color: Colors.green),
          ),
        );
      case TaskPriority.medium:
        return const Center(
          child: Text(
            '!!',
            style: TextStyle(color: Colors.yellow),
          ),
        );
      case TaskPriority.high:
        return const Center(
          child: Text(
            '!!!',
            style: TextStyle(color: Colors.red),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}

class _TaskTileBodyForSelectedContext extends StatelessWidget {
  const _TaskTileBodyForSelectedContext({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.title ?? '',
                    style: TextStyle(
                      decoration: state.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 16,
                    ),
                  ),
                  task.date != null
                      ? Text(
                          DateUtility.getDateText(task.date!),
                          style: TextStyle(
                            color: Colors.black,
                            decoration: state.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontSize: 12,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const Spacer(),
              task.priority != null ? _importantTask() : const SizedBox(),
            ],
          );
        },
      ),
    );
  }

  Widget _importantTask() {
    switch (task.priority) {
      case TaskPriority.low:
        return const Center(
          child: Text(
            '!',
            style: TextStyle(color: Colors.green),
          ),
        );
      case TaskPriority.medium:
        return const Center(
          child: Text(
            '!!',
            style: TextStyle(color: Colors.yellow),
          ),
        );
      case TaskPriority.high:
        return const Center(
          child: Text(
            '!!!',
            style: TextStyle(color: Colors.red),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
