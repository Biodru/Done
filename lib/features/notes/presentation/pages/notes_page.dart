import 'package:done/features/notes/data/models/note.dart';
import 'package:done/features/notes/presentation/widgets/note_tile_widget.dart';
import 'package:done/features/notes/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const AnimatedSearchBar(),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  NoteTileWidget(
                    note: Note(
                        id: 0,
                        topic: 'DupaTytuł',
                        description: 'Dupa opis',
                        lastEdited: DateTime.now(),
                        userContextId: 1,
                        chosenColor: Colors.purple),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
