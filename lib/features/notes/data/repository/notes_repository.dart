import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:done/features/notes/data/models/note.dart';

class NotesRepository {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<List<Note>> getNotes(int? contextId) async {
    var collection =
        firestore.collection('UserData').doc('TestUser').collection('Notes');

    QuerySnapshot<Map<String, dynamic>> result;
    if (contextId != null) {
      result =
          await collection.where('userContextId', isEqualTo: contextId).get();
    } else {
      result = await collection.get();
    }

    if (result.docs.isNotEmpty) {
      return result.docs.map((e) => Note.fromJson(e.data())).toList();
    } else {
      return [];
    }
  }

  Future<void> addNote(Note noteToAdd) async {
    await firestore
        .collection('UserData')
        .doc('TestUser')
        .collection('Notes')
        .doc('${noteToAdd.id}')
        .set(noteToAdd.toJson());
  }

  Future<void> editNote(Map<Object, Object?> dataToEdit, String noteId) async {
    dataToEdit['lastEdited'] = Timestamp.fromDate(DateTime.now());
    await firestore
        .collection('UserData')
        .doc('TestUser')
        .collection('Notes')
        .doc(noteId)
        .update(dataToEdit);
  }

  Future<void> deleteNote(Note noteToDelete) async {
    await firestore
        .collection('UserData')
        .doc('TestUser')
        .collection('Notes')
        .where('noteId', isEqualTo: noteToDelete.id)
        .get()
        .then((value) => value.docs.first.reference.delete());
  }
}
