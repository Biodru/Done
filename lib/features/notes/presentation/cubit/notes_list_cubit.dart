import 'package:bloc/bloc.dart';
import 'package:done/features/notes/data/models/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_list_cubit.freezed.dart';
part 'notes_list_state.dart';

class NotesListCubit extends Cubit<NotesListState> {
  NotesListCubit() : super(const NotesListState.initial());

  void _fetchNotes() {
    //TODO: Make fetching
  }

  void _deleteNote(int index) {
    //TODO: Add deletion inDatabase
    List<Note> _tmp = state.notes;
    _tmp.removeAt(index);
    emit(state.copyWith(notes: _tmp));
  }
}
