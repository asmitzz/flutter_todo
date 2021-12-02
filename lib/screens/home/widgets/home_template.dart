import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          homeHeader(),
          todos(),
        ],
      ),
    );
  }

  Consumer todos() {
    return Consumer<TodoProvider>(builder: (_, todoProvider, __) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: todoProvider.fetchTodos(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }

              if (snapshot.connectionState == ConnectionState.active) {
                List<dynamic> data = snapshot.data!.docs;
                if (data.isEmpty) {
                  return Text(
                    "No todos found!!",
                    style: TextStyle(
                        color: ColorsConstants.blue,
                        fontWeight: FontsConstants.bold),
                  );
                }

                return ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return todoCard(data, index, todoProvider);
                  },
                );
              }
              return const Text("loading");
            }),
      );
    });
  }

  Row todoCard(List<dynamic> data, int index, TodoProvider todoProvider) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
              side: BorderSide(color: ColorsConstants.green, width: 1.5),
              value: data[index]["isComplete"],
              onChanged: (bool? value) {
                todoProvider.completeTodo(docId: data[index].id, value: value);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0))),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          data[index]["title"],
          style: TextStyle(
              color: ColorsConstants.blue, fontWeight: FontsConstants.medium),
        )
      ],
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
