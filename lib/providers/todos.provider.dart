import 'package:flutter/material.dart';
import 'package:flutter_todo/modals/todos.modal.dart';

class TodoProvider with ChangeNotifier {
  List<TodosModal> todos = [];
  String title = "";
  DateTime completedBy = DateTime.now();

  bool isComplete = false;
  bool saveAsAlarm = false;
  bool saveAsNotifications = false;

  final GlobalKey<FormState> formKey = GlobalKey();

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

  void addTodo() {
    TodosModal todo = TodosModal(
        title: title,
        completedBy: completedBy,
        isComplete: isComplete,
        saveAsAlarm: saveAsAlarm,
        saveAsNotifications: saveAsNotifications);
    todos.add(todo);
    notifyListeners();
    title = "";
    completedBy = DateTime.now();
    isComplete = false;
    saveAsAlarm = false;
    saveAsNotifications = false;
  }

  void completeTodo(value, index) {
    TodosModal todo = todos.elementAt(index);
    todo.isComplete = value;
    notifyListeners();
  }
}
