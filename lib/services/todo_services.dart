import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TodoServices {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  String uid = FirebaseAuth.instance.currentUser!.uid;

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

  Future<void> addTodo(
      {required title,
      required completedBy,
      required isComplete,
      required saveAsAlarm,
      required saveAsNotifications}) async {
    try {
      await userCollection.doc(uid).collection("todos").add({
        "title": title,
        "completedBy": completedBy,
        "isComplete": isComplete,
        "saveAsAlarm": saveAsAlarm,
        "saveAsNotifications": saveAsNotifications,
      });
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<void> deleteTodo({required docId}) async {
    try {
      await userCollection.doc(uid).collection("todos").doc(docId).delete();
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<void> updateTodo({required title,
      required completedBy,
      required editId,
      required isComplete,
      required saveAsAlarm,
      required saveAsNotifications}) async {
    try {
      await userCollection.doc(uid).collection("todos").doc(editId).update({
        "title": title,
        "completedBy": completedBy,
        "isComplete": isComplete,
        "saveAsAlarm": saveAsAlarm,
        "saveAsNotifications": saveAsNotifications,
      });
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<void> completeTodo({required docId, bool? value}) async {
    try {
      await userCollection.doc(uid).collection("todos").doc(docId).update({
        "isComplete": value,
      });
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
