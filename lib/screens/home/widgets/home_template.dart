import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/modals/todos.modal.dart';
import 'package:flutter_todo/providers/auth.provider.dart';
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
              builder: (_, todoProvider, __) => todos(todoProvider)),
        ],
      ),
    );
  }

  Padding todos(
    TodoProvider todoProvider,
  ) {
    // List<TodosModal> todos = todoProvider.todos

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: StreamBuilder<DocumentSnapshot>(
          stream: todoProvider.fetchTodos(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            if (snapshot.hasData && !snapshot.data!.exists) {
              todoProvider.createTodos();
              return const Text("Document does not exist");
            }
            if (snapshot.connectionState == ConnectionState.active) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              if (data["todos"].length == 0) {
                return Text(
                  "No todos found!!",
                  style: TextStyle(
                      color: ColorsConstants.blue,
                      fontWeight: FontsConstants.bold),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data["todos"].length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            side: BorderSide(
                                color: ColorsConstants.green, width: 1.5),
                            value: data["todos"][index]["isComplete"],
                            onChanged: (value) {
                              todoProvider.completeTodo(
                                  value, data["todos"][index], index);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0))),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        data["todos"][index]["title"],
                        style: TextStyle(
                            color: ColorsConstants.blue,
                            fontWeight: FontsConstants.medium),
                      )
                    ],
                  );
                },
              );
            }
            return const Text("loading");
          }),
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
