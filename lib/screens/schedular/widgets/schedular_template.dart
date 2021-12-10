import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/helpers/format_data_by_day.dart';
import 'package:flutter_todo/modals/todos.modal.dart';
import 'package:flutter_todo/providers/todos.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/skeleton_loading.dart';
import 'package:flutter_todo/widgets/todo_card.dart';
import 'package:flutter_todo/widgets/todos_header.dart';
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
      children: [
        todosHeader(StringsConstants.schedularTitle1,
            StringsConstants.schedularTitle2),
        todos()
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
              stream: todoProvider.fetchSchedulars(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.active) {
                  List<QueryDocumentSnapshot<Object?>> data =
                      snapshot.data!.docs;
                  if (data.isEmpty) {
                    return Text(
                      "No todos found!!",
                      style: TextStyle(
                          color: ColorsConstants.blue,
                          fontWeight: FontsConstants.bold),
                    );
                  }

                  final Map<String, dynamic> formattedData =
                      formatDataByDay(data);

                  return ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: formattedData.keys.length,
                    itemBuilder: (BuildContext context, int index) {
                      return todosData(
                        formattedData,
                        formattedData.keys.toList()[index],
                      );
                    },
                  );
                }
                return const SkelotonLoading();
              }),
        ),
      );
    });
  }

  Column todosData(Map<String, dynamic> data, String key) {
    final List<TodosModal> todos = data[key];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key,
          style: TextStyle(
            fontSize: FontsConstants.base,
            color: ColorsConstants.blueGrey,
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return todoCard(context, todos[index]);
          },
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 4,
        ),
      ],
    );
  }
}
