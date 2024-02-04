import 'package:done/core/presentation/widgets/app_card_widget.dart';
import 'package:done/features/notes/data/models/note.dart';
import 'package:done/features/notes/presentation/cubit/notes_list_cubit.dart';
import 'package:done/features/notes/presentation/pages/edit_note_page.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NoteTileWidget extends StatelessWidget {
  const NoteTileWidget({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    final userContextCubit = context.watch<UserContextCubit>();

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) {
              return BlocProvider.value(
                value: context.watch<NotesListCubit>(),
                child: BlocProvider.value(
                  value: context.watch<UserContextCubit>(),
                  child: EditNotePage(note: note),
                ),
              );
            },
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: note.chosenColor ?? Colors.blueGrey,
            border: Border(
              left: BorderSide(
                color: note.userContextId != null
                    ? userContextCubit
                        .findContext(note.userContextId!)!
                        .contextColor
                    : note.chosenColor ?? Colors.blueGrey,
                width: 12,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '${note.topic ?? ''}\n',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: note.description,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Edytowano: ${DateFormat('dd/mm/yyyy hh:mm').format(note.lastEdited ?? DateTime.now())}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    //TODO: Add deletion
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoteForSelectedContext extends StatelessWidget {
  const NoteForSelectedContext({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return AppCardWidgetAllContexts(
      cardBody: _NoteBodyForSelectedContext(
        note: note,
      ),
      borderColor: null,
    );
  }
}

class _NoteBodyForSelectedContext extends StatelessWidget {
  const _NoteBodyForSelectedContext({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: '${note.topic}\n',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: note.description,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Edytowano: ${DateFormat('dd/mm/yyyy hh:mm').format(note.lastEdited ?? DateTime.now())}',
              style: const TextStyle(
                fontSize: 8,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(
            Icons.delete_forever,
            color: Colors.red,
          ),
          onPressed: () {
            //TODO: Add deletion
          },
        ),
      ],
    );
  }
}

class NoteForAllContexts extends StatelessWidget {
  const NoteForAllContexts({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return AppCardWidgetAllContexts(
      currentUserContext: context.watch<UserContextCubit>().findContext(
            note.userContextId ?? 0,
          ),
      cardBody: _NoteBodyForSelectedContext(note: note),
      borderColor: null,
    );
  }
}
