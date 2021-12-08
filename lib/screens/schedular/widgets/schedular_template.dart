import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/helpers/todo_dismissable_handler.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/providers/todos.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/dismissibale_backgrounds.dart';
import 'package:flutter_todo/widgets/skeleton_loading.dart';
import 'package:provider/provider.dart';

class SchedularTemplate extends StatefulWidget {
  const SchedularTemplate({Key? key}) : super(key: key);

  @override
  _SchedularTemplateState createState() => _SchedularTemplateState();
}

class _SchedularTemplateState extends State<SchedularTemplate> {
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
      children: [schedularHeader(), todos()],
    );
  }

  Consumer todos() {
    return Consumer<TodoProvider>(builder: (_, todoProvider, __) {
      return Container(
        height: SizeConfig.safeBlockVertical * 55,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 4,
            vertical: SizeConfig.blockSizeVertical * 4),
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
              stream: todoProvider.fetchSchedulars(),
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
        
                  final int tomorrow = DateTime.now().day + 1;
                  Map<dynamic, dynamic> formattedData = {};
        
                  data.forEach((value) {
                    String day =
                        value["completedBy"].toDate().day.compareTo(tomorrow) == 0
                            ? "Tomorrow"
                            : value["completedBy"]
                                .toDate()
                                .toString()
                                .substring(0, 10);
                    if (formattedData.containsKey(day)) {
                      formattedData[day] = [...formattedData[day], value];
                    } else {
                      formattedData[day] = [value];
                    }
                  });
        
                  return ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: formattedData.keys.length,
                    itemBuilder: (BuildContext context, int index) {
                      return todoCard(formattedData,
                          formattedData.keys.toList()[index], todoProvider);
                    },
                  );
                }
                return const SkelotonLoading();
              }),
        ),
      );
    });
  }

  Column todoCard(
      Map<dynamic, dynamic> data, String key, TodoProvider todoProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          key,
          style: TextStyle(
            color: ColorsConstants.blueGrey,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data[key].length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: UniqueKey(),
              background: DismissibleBackgrounds().slideRightBackground(),
              secondaryBackground:
                  DismissibleBackgrounds().slideLeftBackground(),
              confirmDismiss: (direction) =>
                  dismissableTodohandler(context,direction, data[key][index], todoProvider),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                        side: BorderSide(
                            color: ColorsConstants.green, width: 1.5),
                        value: data[key][index]["isComplete"],
                        onChanged: (bool? value) {
                          todoProvider.completeTodo(
                              docId: data[key][index].id, value: value);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0))),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    data[key][index]["title"],
                    style: TextStyle(
                      fontWeight: FontsConstants.medium,
                      color: ColorsConstants.blue,
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}

Container schedularHeader() {
  return Container(
    height: SizeConfig.safeBlockVertical * 25,
    constraints: const BoxConstraints(minWidth: double.infinity),
    padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 6,
            vertical: SizeConfig.blockSizeVertical * 6),
    decoration: BoxDecoration(
      color: ColorsConstants.lightRosyBrown,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsConstants.schedular["title_1"],
          style: TextStyle(
              color: ColorsConstants.blue,
              fontSize: FontsConstants.lg_1,
              fontWeight: FontsConstants.bold),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              StringsConstants.schedular["title_2"],
              style: TextStyle(
                  color: ColorsConstants.blue,
                  fontSize: FontsConstants.lg_1,
                  fontWeight: FontsConstants.bold),
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
