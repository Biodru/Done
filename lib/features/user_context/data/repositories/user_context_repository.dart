import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:done/features/user_context/data/models/user_context.dart';

class UserContextRepository {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

//TODO: Remove TestUser
//TODO: Remove hardcoded Strings
  Future<List<UserContext>> getTasks() async {
    final collection = await firestore
        .collection('UserData')
        .doc('TestUser')
        .collection('UserContext')
        .get();
    return collection.docs.map((e) => UserContext.fromJson(e.data())).toList();
  }

  Future<void> addContext(UserContext contextToAdd) async {
    await firestore
        .collection('UserData')
        .doc('TestUser')
        .collection('UserContext')
        .add(contextToAdd.toJson());
  }

  Future<void> selectContext(int? newContext) async {
    await firestore
        .collection('UserData')
        .doc('TestUser')
        .update({'userContextId': newContext});
  }

  Future<int?> getSelectedContext() async {
    final result = await firestore.collection('UserData').doc('TestUser').get();
    return result['userContextId'];
  }
}
