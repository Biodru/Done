import 'package:bloc/bloc.dart';
import 'package:done/features/notes/data/models/note.dart';
import 'package:done/features/notes/data/repository/notes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_list_cubit.freezed.dart';
part 'notes_list_state.dart';

class NotesListCubit extends Cubit<NotesListState> {
  NotesListCubit(int? currentContextId)
      : super(const NotesListState.initial()) {
    _fetchNotes(currentContextId);
  }

  final _repository = NotesRepository();

  void addOrEditNote(Note note, int? currentContextId) async {
    emit(NotesListState.loading());
    await _repository.addNote(note);
    _fetchNotes(currentContextId);
  }

  void editNote(int? currentContextId, Map<Object, Object?> dataToEdit,
      String noteId) async {
    emit(NotesListState.loading());
    await _repository.editNote(dataToEdit, noteId);
    _fetchNotes(currentContextId);
  }

  int getMaxId() {
    return state.notes.isNotEmpty
        ? state.notes
                .reduce((curr, next) => curr.id > next.id ? curr : next)
                .id +
            1
        : 1;
  }

  void _fetchNotes(int? currentContextId) async {
    emit(NotesListState.loading());
    final result = await _repository.getNotes(currentContextId);
    emit(NotesListState.data(result));
  }

  void _deleteNote(int index) {
    //TODO: Add deletion inDatabase
    List<Note> tmp = state.notes;
    tmp.removeAt(index);
    emit(state.copyWith(notes: tmp));
  }
}
