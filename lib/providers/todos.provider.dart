import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/modals/todos.modal.dart';
import 'package:flutter_todo/services/todo_services.dart';
import 'package:flutter_todo/widgets/toast.dart';

class TodoProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey();

  String title = "";
  DateTime completedBy = DateTime.now();
  bool isComplete = false;
  bool saveAsAlarm = false;
  bool saveAsNotifications = false;
  String editId = "";

  void updateTitle(String value) {
    title = value;
    notifyListeners();
  }

  void updateEditId({required String docId}) {
    editId = docId;
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

  void setFields(
      {required String setTitle,
      required DateTime setCompletedBy,
      required bool setIsComplete,
      required bool setSaveAsAlarm,
      required bool setSaveAsNotifications}) {
    title = setTitle;
    completedBy = setCompletedBy;
    isComplete = setIsComplete;
    saveAsAlarm = setSaveAsAlarm;
    saveAsNotifications = setSaveAsNotifications;
    notifyListeners();
  }

  Stream<QuerySnapshot<Object?>> fetchTodos() {
    return TodoServices().fetchTodos();
  }

  Stream<QuerySnapshot<Object?>> fetchSchedulars() {
    return TodoServices().fetchSchedulars();
  }

  Future<void> addTodo() async {
    Map<String, dynamic> todo = TodosModal(
            title: title,
            completedBy: completedBy,
            isComplete: isComplete,
            saveAsAlarm: saveAsAlarm,
            saveAsNotifications: saveAsNotifications)
        .toJson();

    try {
      await TodoServices().addTodo(todo);
      resetFields();
      navigatorKey.currentState!.pop();
      MyToast().successToast("Todo added");
    } catch (e) {
      MyToast().errorToast(e.toString());
    }
  }

  Future<void> deleteTodo({required docId}) async {
    try {
      await TodoServices().deleteTodo(docId: docId);
      return MyToast().successToast("Todo Deleted");
    } catch (e) {
      return MyToast().errorToast(e.toString());
    }
  }

  Future<void> updateTodo() async {
    Map<String, dynamic> todo = TodosModal(
            title: title,
            completedBy: completedBy,
            isComplete: isComplete,
            saveAsAlarm: saveAsAlarm,
            saveAsNotifications: saveAsNotifications)
        .toJson();
    try {
      await TodoServices().updateTodo(todo,editId);
      resetFields();
      updateEditId(docId: "");
      navigatorKey.currentState!.pop();
      MyToast().successToast("Todo Updated");
    } catch (e) {
      return MyToast().errorToast(e.toString());
    }
  }

  Future<void> completeTodo({required docId, bool? value}) async {
    try {
      await TodoServices().completeTodo(docId: docId, value: value);
    } catch (e) {
      return MyToast().errorToast(e.toString());
    }
  }
}
