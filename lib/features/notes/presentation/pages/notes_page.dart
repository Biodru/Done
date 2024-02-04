import 'package:done/core/presentation/widgets/loading_view.dart';
import 'package:done/features/notes/presentation/cubit/notes_list_cubit.dart';
import 'package:done/features/notes/presentation/widgets/note_tile_widget.dart';
import 'package:done/features/notes/presentation/widgets/search_bar.dart';
import 'package:done/features/todo_list/presentation/widgets/no_items.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<UserContextCubit, UserContextState>(
          builder: (context, state) {
            return Column(
              children: [
                const AnimatedSearchBar(),
                const SizedBox(height: 8),
                BlocBuilder<NotesListCubit, NotesListState>(
                  buildWhen: (previuos, current) =>
                      previuos.isLoading != current.isLoading,
                  builder: (context, state) {
                    return state.isLoading
                        ? const LoadingView()
                        : Expanded(
                            child: state.notes.isEmpty
                                ? const NoItems(
                                    errorMessage:
                                        'Nie masz obecnie żadnych zadań w wybranym kontekście',
                                  )
                                : const _NotesNoErrorWrapper(),
                          );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NotesNoErrorWrapper extends StatelessWidget {
  const _NotesNoErrorWrapper();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<NotesListCubit>();
    final contextCubit = context.watch<UserContextCubit>();
    final list = contextCubit.state.currentContextId != null
        ? cubit.state.notes.where((element) =>
            element.userContextId == contextCubit.state.currentContextId)
        : cubit.state.notes;
    return ListView(
      children: list
          .map(
            (note) => NoteTileWidget(
              note: note,
            ),
          )
          .toList(),
    );
  }
}
