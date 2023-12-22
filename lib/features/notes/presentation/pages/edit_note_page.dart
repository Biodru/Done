import 'package:done/config/theme/main_theme.dart';
import 'package:done/features/notes/data/models/note.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNotePage extends StatelessWidget {
  EditNotePage({super.key, required this.note});

  final Note note;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userContextCubit = context.watch<UserContextCubit>();

    return Scaffold(
      backgroundColor: note.chosenColor ?? MainTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: note.userContextId != null
                        ? userContextCubit
                            .findContext(note.userContextId!)!
                            .contextColor
                        : note.chosenColor ?? Colors.blueGrey,
                  ),
                ),
                const Spacer(),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: _titleController,
                    style: const TextStyle(color: Colors.black, fontSize: 32),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: note.topic),
                  ),
                  TextField(
                    controller: _descriptionController,
                    style: const TextStyle(color: Colors.black, fontSize: 24),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: note.description ?? 'Tutaj wpisz opis'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: Save changes
          Navigator.pop(context);
        },
        elevation: 5,
        backgroundColor: note.userContextId != null
            ? userContextCubit.findContext(note.userContextId!)!.contextColor
            : note.chosenColor ?? Colors.blueGrey,
        child: Icon(
          Icons.save_sharp,
          color: note.chosenColor ?? MainTheme.primary,
        ),
      ),
    );
  }
}
