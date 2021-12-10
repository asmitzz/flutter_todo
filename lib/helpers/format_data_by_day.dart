import 'package:flutter_todo/modals/todos.modal.dart';

Map<String, dynamic> formatDataByDay(data) {
    final int tomorrow = DateTime.now().day + 1;
    Map<String, dynamic> formattedData = {};

    for (var value in data) {
      TodosModal todo = TodosModal.fromJson(value);

      String day = todo.completedBy.day.compareTo(tomorrow) == 0
          ? "Tomorrow"
          : todo.completedBy.toString().substring(0, 10);
      if (formattedData.containsKey(day)) {
        formattedData[day].add(todo);
      } else {
        formattedData[day] = [todo];
      }
    }
    return formattedData;
  }