import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/providers/todos.provider.dart';

Future<bool?> dismissableTodohandler(
      BuildContext context,
      DismissDirection direction, item, TodoProvider todoProvider) async {
    if (direction == DismissDirection.endToStart) {
      final bool res = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text("Are you sure you want to delete this todo?"),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop(false);
                  },
                ),
                TextButton(
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    todoProvider.deleteTodo(docId: item.id);
                    Navigator.of(context, rootNavigator: true).pop(true);
                  },
                ),
              ],
            );
          });
      return res;
    } else {
      todoProvider.updateEditId(docId:item.id);
      todoProvider.setFields(
          setTitle: item["title"],
          setIsComplete: item["isComplete"],
          setCompletedBy: item["completedBy"].toDate(),
          setSaveAsAlarm: item["saveAsAlarm"],
          setSaveAsNotifications: item["saveAsNotifications"],
      );
      navigatorKey.currentState!.pushNamed("/new-task");
    }
  }