import 'package:done/features/todo_list/presentation/cubit/task_list_cubit/task_list_cubit.dart';
import 'package:done/features/todo_list/presentation/widgets/no_items.dart';
import 'package:done/features/todo_list/presentation/widgets/task_tile.dart';
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
    return list.isEmpty
        ? const NoItems(
            errorMessage:
                'Nie masz obecnie żadnych zadań w wybranym kontekście',
          )
        : ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: list
                .map(
                  (task) => contextCubit.state.currentContextId == null
                      ? TaskTileForAllContexts(
                          task: task,
                        )
                      : TaskTileForSelectedContext(
                          task: task,
                        ),
                )
                .toList(),
          );
  }
}
