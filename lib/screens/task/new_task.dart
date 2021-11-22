import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/task/widgets/new_task_body.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String email = "example@gmail.com";


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        shadowColor:  ColorsConstants.lightRosyBrown,
        backgroundColor:  ColorsConstants.rosyBrown,
        iconTheme:  IconThemeData(color: ColorsConstants.blue),
        title:  Text(
          StringsConstants.newTask["title"],
          style: TextStyle(
              color: ColorsConstants.blue,
              fontSize: FontsConstants.base,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0),
        ),
      ),
      body: const NewTaskBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor:  ColorsConstants.blue,
        onPressed: () {},
        child: Icon(
          Icons.check,
          color: ColorsConstants.white,
        ),
      ),
    );
  }
}
