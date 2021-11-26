import 'package:flutter/material.dart';
import 'package:flutter_todo/modals/todos.modal.dart';
import 'package:flutter_todo/providers/todos.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:provider/provider.dart';

class HomeTemplate extends StatefulWidget {
  const HomeTemplate({Key? key}) : super(key: key);

  @override
  _HomeTemplateState createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          homeHeader(),
          Consumer<TodoProvider>(
              builder: (_, todoProvider, __) => todos(todoProvider))
        ],
      ),
    );
  }

  Padding todos(TodoProvider todoProvider) {
    List<TodosModal> todos = todoProvider.todos
        .where((element) =>
            element.completedBy.day.compareTo(DateTime.now().day) == 0)
        .toList();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                    side: BorderSide(color: ColorsConstants.green, width: 1.5),
                    value: todos[index].isComplete,
                    onChanged: (value) {
                      todoProvider.completeTodo(
                          value, todoProvider.todos.indexOf(todos[index]));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0))),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                todos[index].title,
                style: TextStyle(
                    color: ColorsConstants.blue,
                    fontWeight: FontsConstants.medium),
              )
            ],
          );
        },
      ),
    );
  }
}

Container homeHeader() {
  return Container(
    constraints: const BoxConstraints(minWidth: double.infinity),
    decoration: BoxDecoration(
      color: ColorsConstants.lightRosyBrown,
    ),
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsConstants.home["title_1"],
            style: TextStyle(
                color: ColorsConstants.blue,
                fontSize: FontsConstants.lg_1,
                fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                StringsConstants.home["title_2"],
                style: TextStyle(
                    color: ColorsConstants.blue,
                    fontSize: FontsConstants.lg_1,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 3.0),
                  width: 25.0,
                  height: 3.0,
                  color: ColorsConstants.blue)
            ],
          )
        ],
      ),
    ),
  );
}
