import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/helpers/todo_dismissable_handler.dart';
import 'package:flutter_todo/providers/todos.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/dismissibale_backgrounds.dart';
import 'package:flutter_todo/widgets/skeleton_loading.dart';
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
    return Column(
      children: [
        homeHeader(),
        todos(),
      ],
    );
  }

  Consumer todos() {
    return Consumer<TodoProvider>(builder: (_, todoProvider, __) {
      return Container(
        height: SizeConfig.safeBlockVertical * 52,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 6,
            vertical: SizeConfig.blockSizeVertical * 4),
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
              stream: todoProvider.fetchTodos(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.active) {
                  List<dynamic> data = snapshot.data!.docs;
                  if (data.isEmpty) {
                    return Text(
                      "No todos found!!",
                      style: TextStyle(
                        fontSize:FontsConstants.sm,
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
                return const SkelotonLoading();
              }),
        ),
      );
    });
  }

  Dismissible todoCard(
      List<dynamic> data, int index, TodoProvider todoProvider) {
    return Dismissible(
      direction: DismissDirection.horizontal,
      key: UniqueKey(),
      background: DismissibleBackgrounds().slideRightBackground(),
      secondaryBackground: DismissibleBackgrounds().slideLeftBackground(),
      confirmDismiss: (direction) =>
          dismissableTodohandler(context, direction, data[index], todoProvider),
      child: Row(
        children: [
          Transform.scale(
            scale: SizeConfig.blockSizeHorizontal * 0.25,
            child: Checkbox(
                side: BorderSide(color: ColorsConstants.green, width: 1.5),
                value: data[index]["isComplete"],
                onChanged: (bool? value) {
                  todoProvider.completeTodo(
                      docId: data[index].id, value: value);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0))),
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 3,
          ),
          Text(
            data[index]["title"],
            style: TextStyle(
                color: ColorsConstants.blue, 
                fontSize: FontsConstants.base,
                fontWeight: FontsConstants.medium),
          ),
           SizedBox(
            height: SizeConfig.blockSizeVertical * 4,
          ),
        ],
      ),
    );
  }
}

Container homeHeader() {
  return Container(
    height: SizeConfig.safeBlockVertical * 25,
    constraints: const BoxConstraints(minWidth: double.infinity),
    decoration: BoxDecoration(
      color: ColorsConstants.lightRosyBrown,
    ),
    padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 6,
            vertical: SizeConfig.blockSizeVertical * 6),
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
  );
}
