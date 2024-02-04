import 'package:done/features/todo_list/presentation/cubit/task_list_cubit/task_list_cubit.dart';
import 'package:done/features/todo_list/presentation/widgets/filter_button.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:flutter/material.dart';

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
