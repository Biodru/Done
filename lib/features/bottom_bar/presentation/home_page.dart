import 'package:done/config/theme/main_theme.dart';
import 'package:done/core/util/app_theme_properties.dart';
import 'package:done/features/bottom_bar/presentation/cubit/cubit/bottom_bar_cubit.dart';
import 'package:done/features/bottom_bar/presentation/widgets/bottom_bar_widget.dart';
import 'package:done/features/notes/presentation/pages/notes_page.dart';
import 'package:done/features/todo_list/presentation/pages/todo_list_page.dart';
import 'package:done/features/user_context/presentation/pages/user_context_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final pages = const [
    TodoListPage(),
    NotesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomBarCubit(),
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
                  // showModalBottomSheet<void>(
                  //   context: context,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(16.0),
                  //   ),
                  //   backgroundColor: MainTheme.backgroundColor,
                  //   builder: (BuildContext context) {
                  //     return AddTaskModal(
                  //       userContextCubit: contextCubit,
                  //       cubit: cubit,
                  //     );
                  //   },
                  // );
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
