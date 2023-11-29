import 'package:done/config/theme/main_theme.dart';
import 'package:done/core/util/date_utils.dart';
import 'package:done/features/todo_list/data/models/task.dart';
import 'package:done/features/todo_list/presentation/cubit/task_cubit/task_cubit.dart';
import 'package:done/features/todo_list/presentation/cubit/task_list_cubit/task_list_cubit.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoTile extends StatelessWidget {
  final Task task;
  const TodoTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  Widget importantTask() {
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

  @override
  Widget build(BuildContext context) {
    final userContextCubit = context.watch<UserContextCubit>();
    return Container(
      height: 100,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: task.chosenColor?.withOpacity(0.3) ??
              MainTheme.primary.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 20,
          offset: const Offset(0, 10), // changes position of shadow
        ),
      ]),
      child: BlocProvider<TaskCubit>(
        create: (context) => TaskCubit(),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  _tapped(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Container(
                        color: task.chosenColor,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 16,
                            color: task.userContextId != null
                                ? userContextCubit
                                    .findContext(task.userContextId!)
                                    ?.contextColor
                                : task.chosenColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                        child: Row(
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
                            task.priority != null
                                ? importantTask()
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _tapped(BuildContext context) {
    final cubit = context.read<TaskCubit>();
    final listCubit = context.read<TaskListCubit>();
    cubit.taskDone();
    listCubit.taskIsTapped(task);
  }
}
