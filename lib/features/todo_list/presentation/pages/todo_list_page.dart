import 'package:done/core/presentation/widgets/loading_view.dart';
import 'package:done/features/todo_list/presentation/cubit/task_list_cubit/task_list_cubit.dart';
import 'package:done/features/todo_list/presentation/widgets/no_error.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userContextCubit = context.watch<UserContextCubit>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<UserContextCubit, UserContextState>(
          builder: (context, state) {
            return BlocProvider<TaskListCubit>(
              create: (context) =>
                  TaskListCubit(userContextCubit.state.currentContextId),
              child: Builder(builder: (context) {
                final cubit = context.watch<TaskListCubit>();
                return Column(
                  children: [
                    TasksFilterRow(
                        cubit: cubit, contextCubit: userContextCubit),
                    BlocBuilder<TaskListCubit, TaskListState>(
                      buildWhen: (previous, current) =>
                          previous.isLoading != current.isLoading,
                      builder: (context, state) => state.isLoading
                          ? const LoadingView()
                          : const NoErrorState(),
                    ),
                  ],
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
