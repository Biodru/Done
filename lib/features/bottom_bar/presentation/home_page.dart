import 'package:done/config/theme/main_theme.dart';
import 'package:done/core/util/app_theme_properties.dart';
import 'package:done/features/bottom_bar/presentation/cubit/cubit/bottom_bar_cubit.dart';
import 'package:done/features/bottom_bar/presentation/widgets/bottom_bar_widget.dart';
import 'package:done/features/notes/presentation/cubit/notes_list_cubit.dart';
import 'package:done/features/notes/presentation/pages/edit_note_page.dart';
import 'package:done/features/notes/presentation/pages/notes_page.dart';
import 'package:done/features/todo_list/presentation/cubit/task_list_cubit/task_list_cubit.dart';
import 'package:done/features/todo_list/presentation/pages/task_list_page.dart';
import 'package:done/features/todo_list/presentation/widgets/add_task_modal.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:done/features/user_context/presentation/pages/user_context_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final pages = const [
    TaskListPage(),
    NotesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final userContextCubit = context.watch<UserContextCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskListCubit>(
          create: (BuildContext context) =>
              TaskListCubit(userContextCubit.state.currentContextId),
        ),
        BlocProvider<NotesListCubit>(
          create: (BuildContext context) =>
              NotesListCubit(userContextCubit.state.currentContextId),
        ),
      ],
      child: BlocBuilder<BottomBarCubit, BottomBarState>(
        buildWhen: (previous, current) =>
            previous.pageIndex != current.pageIndex,
        builder: (context, state) {
          final bottomBarCubit = context.watch<BottomBarCubit>();
          return Scaffold(
            floatingActionButton: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [AppThemeProperties.shadow],
              ),
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: MainTheme.accent,
                onPressed: () {
                  if (state.pageIndex == 0) {
                    showModalBottomSheet<void>(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      backgroundColor: MainTheme.backgroundColor,
                      builder: (_) {
                        return BlocProvider.value(
                          value: context.watch<TaskListCubit>(),
                          child: BlocProvider.value(
                            value: context.watch<UserContextCubit>(),
                            child: const AddTaskModal(),
                          ),
                        );
                      },
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) {
                          return BlocProvider.value(
                            value: context.watch<NotesListCubit>(),
                            child: BlocProvider.value(
                              value: context.watch<UserContextCubit>(),
                              child: const EditNotePage(note: null),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
                child: const Icon(
                  Icons.add,
                  color: MainTheme.primary,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            extendBody: true,
            backgroundColor: MainTheme.backgroundColor,
            drawerScrimColor: MainTheme.secondary,
            endDrawer: const UserContextDrawer(),
            appBar: AppBar(
              title: Text(
                bottomBarCubit.getAppBarTitle(),
                style: const TextStyle(color: MainTheme.secondary),
              ),
              iconTheme: const IconThemeData(color: MainTheme.secondary),
              elevation: 1,
              backgroundColor: MainTheme.backgroundColor,
            ),
            bottomNavigationBar: const BottomBarWidget(),
            body: pages[state.pageIndex],
          );
        },
      ),
    );
  }
}
