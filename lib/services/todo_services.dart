import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TodoServices {
  CollectionReference todosCollection = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("todos");

  Stream<QuerySnapshot<Object?>> fetchTodos() {
    final DateTime currentTime = DateTime.now();
    final DateTime startTime =
        DateTime(currentTime.year, currentTime.month, currentTime.day);
    final DateTime endTime = startTime.add(const Duration(hours: 24));

    return todosCollection
        .where(
          "completedBy",
          isGreaterThanOrEqualTo: Timestamp.fromDate(startTime),
          isLessThan: Timestamp.fromDate(endTime),
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Object?>> fetchSchedulars() {
    final DateTime currentTime = DateTime.now();
    final DateTime startTime =
        DateTime(currentTime.year, currentTime.month, currentTime.day);
    final DateTime endTime = startTime.add(const Duration(hours: 24));

    return todosCollection
        .where(
          "completedBy",
          isGreaterThanOrEqualTo: Timestamp.fromDate(endTime),
        )
        .snapshots();
  }

  Future<void> addTodo(Map<String, dynamic> todo) async {
    try {
      await todosCollection.add(todo);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> deleteTodo({required docId}) async {
    try {
      await todosCollection.doc(docId).delete();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> updateTodo(Map<String, dynamic> todo,String docId) async {
    try {
      await todosCollection.doc(docId).update(todo);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> completeTodo({required docId, bool? value}) async {
    try {
      await todosCollection.doc(docId).update({
        "isComplete": value,
      });
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
