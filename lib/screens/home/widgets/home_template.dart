import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        todosHeader(StringsConstants.homeTitle1,StringsConstants.homeTitle2),
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
                  List<QueryDocumentSnapshot<Object?>> data =
                      snapshot.data!.docs;
                  if (data.isEmpty) {
                    return Text(
                      "No todos found!!",
                      style: TextStyle(
                          fontSize: FontsConstants.sm,
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
                      TodosModal todo = TodosModal.fromJson(data[index]);
                      return todoCard(context,todo);
                    },
                  );
                }
                return const SkelotonLoading();
              }),
        ),
      );
    });
  }

}