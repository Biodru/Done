part of 'notes_list_cubit.dart';

@freezed
class NotesListState with _$NotesListState {
  const factory NotesListState.initial({
    @Default(false) bool isLoading,
    @Default([]) List<Note> notes,
  }) = _NotesListState;

  factory NotesListState.loading() {
    return const _NotesListState(isLoading: true, notes: []);
  }

  factory NotesListState.data(List<Note> notes) {
    return _NotesListState(isLoading: false, notes: notes);
  }
}
