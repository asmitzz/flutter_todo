import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
  String title = "";
  DateTime completedBy = DateTime.now();

  bool isComplete = false;
  bool saveAsAlarm = false;
  bool saveAsNotifications = false;

  final GlobalKey<FormState> formKey = GlobalKey();
  CollectionReference todosCollection =
      FirebaseFirestore.instance.collection('todos');
  String uid = FirebaseAuth.instance.currentUser!.uid;

  void updateTitle(String value) {
    title = value;
    notifyListeners();
  }

  void updateCompletedBy(DateTime value) {
    completedBy = value;
    notifyListeners();
  }

  void updateIsComplete(bool value) {
    isComplete = value;
    notifyListeners();
  }

  void updateSaveAsAlarm(bool value) {
    saveAsAlarm = value;
    notifyListeners();
  }

  void updateSaveAsNotifications(bool value) {
    saveAsNotifications = value;
    notifyListeners();
  }

  Stream<DocumentSnapshot<Object?>> fetchTodos() {
    return todosCollection.doc(uid).snapshots();
  }

  Future<void> addTodo() {
    return todosCollection.doc(uid).update({
      "todos": FieldValue.arrayUnion([
        {
          "title": title,
          "completedBy": completedBy,
          "isComplete": isComplete,
          "saveAsAlarm": saveAsAlarm,
          "saveAsNotifications": saveAsNotifications,
        }
      ])
    });
  }

  createTodos() {
    return todosCollection.doc(uid).set({"todos":[]});
  }

  completeTodo(bool? value, item, index) {
    item["isComplete"] = value;
    todosCollection.doc(uid).get().then((DocumentSnapshot documentSnapshot) {
      List<dynamic> getTodos = documentSnapshot.get("todos");
      getTodos = getTodos.asMap().entries.map((entry) {
        return entry.key == index ? item : entry.value;
      }).toList();
      todosCollection.doc(uid).update({"todos": getTodos});
    });
  }
}
