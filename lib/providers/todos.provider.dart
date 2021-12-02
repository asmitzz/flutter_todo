import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/widgets/toast.dart';

class TodoProvider with ChangeNotifier {
  String title = "";
  DateTime completedBy = DateTime.now();

  bool isComplete = false;
  bool saveAsAlarm = false;
  bool saveAsNotifications = false;

  final GlobalKey<FormState> formKey = GlobalKey();
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
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

  void resetFields() {
    title = "";
    completedBy = DateTime.now();

    isComplete = false;
    saveAsAlarm = false;
    saveAsNotifications = false;
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchTodos() {
    final DateTime currentTime = DateTime.now();
    final DateTime startTime =
        DateTime(currentTime.year, currentTime.month, currentTime.day);
    final DateTime endTime = startTime.add(const Duration(hours: 24));

    return userCollection
        .doc(uid)
        .collection("todos")
        .where(
          "completedBy",
          isGreaterThanOrEqualTo: Timestamp.fromDate(startTime),
          isLessThan: Timestamp.fromDate(endTime),
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchSchedulars() {
    final DateTime currentTime = DateTime.now();
    final DateTime startTime =
        DateTime(currentTime.year, currentTime.month, currentTime.day);
    final DateTime endTime = startTime.add(const Duration(hours: 24));

    return userCollection
        .doc(uid)
        .collection("todos")
        .where(
          "completedBy",
          isGreaterThanOrEqualTo: Timestamp.fromDate(endTime),
        )
        .snapshots();
  }

   addTodo() async {
    try {
      await userCollection.doc(uid).collection("todos").add({
        "title": title,
        "completedBy": completedBy,
        "isComplete": isComplete,
        "saveAsAlarm": saveAsAlarm,
        "saveAsNotifications": saveAsNotifications,
      });
      resetFields();
      navigatorKey.currentState!.pop();
      return MyToast().successToast("Todo added");
    } catch (e) {
      return MyToast().errorToast(e.toString());
    }
  }

  Future<void> completeTodo({docId, bool? value}) async{
    await userCollection.doc(uid).collection("todos").doc(docId).update({
      "isComplete": value,
    });
  }
}
