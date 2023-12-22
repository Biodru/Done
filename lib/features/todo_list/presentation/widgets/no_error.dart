import 'package:done/features/todo_list/presentation/cubit/task_list_cubit/task_list_cubit.dart';
import 'package:done/features/todo_list/presentation/widgets/filter_button.dart';
import 'package:done/features/todo_list/presentation/widgets/no_items.dart';
import 'package:done/features/todo_list/presentation/widgets/todo_tile.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoErrorState extends StatelessWidget {
  const NoErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TaskListCubit>();
    final contextCubit = context.watch<UserContextCubit>();
    final list = contextCubit.state.currentContextId != null
        ? cubit.state.items.where((element) =>
            element.userContextId == contextCubit.state.currentContextId)
        : cubit.state.items;
    return Stack(
      children: [
        list.isEmpty
            ? const NoItems()
            : Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: list
                        .map(
                          (task) => TodoTile(
                            task: task,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: SizedBox(
        //     width: 50,
        //     height: 50,
        //     child: FloatingActionButton(
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(16),
        //       ),
        //       backgroundColor: MainTheme.accent,
        //       onPressed: () {
        //         showModalBottomSheet<void>(
        //             context: context,
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(16.0),
        //             ),
        //             backgroundColor: MainTheme.backgroundColor,
        //             builder: (BuildContext context) {
        //               return AddTaskModal(
        //                 userContextCubit: contextCubit,
        //                 cubit: cubit,
        //               );
        //             });
        //       },
        //       child: const Icon(
        //         Icons.add,
        //         color: MainTheme.primary,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class TasksFilterRow extends StatelessWidget {
  const TasksFilterRow({
    super.key,
    required this.cubit,
    required this.contextCubit,
  });

  final TaskListCubit cubit;
  final UserContextCubit contextCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FilterButton(
          counter: cubit.state.dateFilterCounter,
          icon: Icons.calendar_month_outlined,
          buttonTitle: 'Data',
          sortAction: () {
            cubit.sortTasksByDate(contextCubit.state.currentContextId);
          },
        ),
        FilterButton(
          counter: cubit.state.priorityFilterCounter,
          icon: Icons.error_outline,
          buttonTitle: 'Priorytet',
          sortAction: () =>
              cubit.sortTasksByPriority(contextCubit.state.currentContextId),
        ),
      ],
    );
  }
}
