import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/providers/todos.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/size_config.dart';

Future<bool?> dismissableTodohandler(BuildContext context,
    DismissDirection direction, item, TodoProvider todoProvider) async {
  if (direction == DismissDirection.endToStart) {
    final bool res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            buttonPadding:EdgeInsets.symmetric(
              horizontal:SizeConfig.blockSizeHorizontal * 4,
              vertical: SizeConfig.blockSizeVertical * 4
              ) ,
            contentPadding: EdgeInsets.symmetric(
              horizontal:SizeConfig.blockSizeHorizontal * 6,
              vertical: SizeConfig.blockSizeVertical * 6
              ),
            content: Text(
              "Are you sure you want to delete this todo?",
              style: TextStyle(fontSize: FontsConstants.base,
              fontWeight: FontsConstants.medium,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: FontsConstants.base, color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(false);
                },
              ),
              TextButton(
                child: Text(
                  "Delete",
                  style: TextStyle(
                      fontSize: FontsConstants.base, color: Colors.red),
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
    todoProvider.updateEditId(docId: item.id);
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
