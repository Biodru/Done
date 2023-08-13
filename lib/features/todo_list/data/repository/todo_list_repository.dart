import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:done/features/todo_list/data/models/task.dart';

class TodoListRepository {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  //TODO: Remove hardcoded Strings

  Future<List<Task>> getTasks(int? contextId) async {
    var collection =
        firestore.collection('UserData').doc('TestUser').collection('Tasks');

    QuerySnapshot<Map<String, dynamic>> result;
    if (contextId != null) {
      result =
          await collection.where('userContextId', isEqualTo: contextId).get();
    } else {
      result = await collection.get();
    }

    if (result.docs.isNotEmpty) {
      return result.docs.map((e) => Task.fromJson(e.data())).toList();
    } else {
      return [];
    }
  }

  Future<void> addTask(Task taskToAdd) async {
    await firestore
        .collection('UserData')
        .doc('TestUser')
        .collection('Tasks')
        .add(taskToAdd.toJson());
  }

  Future<void> toggleTask(Task task) async {
    await firestore
        .collection('UserData')
        .doc('TestUser')
        .collection('Tasks')
        .where('taskId', isEqualTo: task.id)
        .get()
        .then((value) => value.docs.forEach((doc) {
              doc.reference.update({'isDone': task.isDone});
            }));
  }
}
