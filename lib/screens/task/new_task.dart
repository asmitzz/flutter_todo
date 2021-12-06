import 'package:flutter/material.dart';
import 'package:flutter_todo/providers/todos.provider.dart';
import 'package:flutter_todo/screens/task/widgets/new_task_body.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:provider/provider.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodoProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        if (todosProvider.editId != "") {
          todosProvider.resetFields();
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          shadowColor: ColorsConstants.lightRosyBrown,
          backgroundColor: ColorsConstants.rosyBrown,
          iconTheme: IconThemeData(color: ColorsConstants.blue),
          title: Text(
            todosProvider.editId == ""
                ? StringsConstants.newTask["title1"]
                : StringsConstants.newTask["title2"],
            style: TextStyle(
                color: ColorsConstants.blue,
                fontSize: FontsConstants.base,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0),
          ),
        ),
        body: const SingleChildScrollView(child: NewTaskBody()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorsConstants.blue,
          onPressed: () async {
            if (todosProvider.formKey.currentState!.validate()) {
              if (todosProvider.editId == "") {
                setState(() {
                  isLoading = true;
                });
                await todosProvider.addTodo();
                 setState(() {
                  isLoading = false;
                });
              } else {
                 setState(() {
                  isLoading = true;
                });
                await todosProvider.updateTodo();
                 setState(() {
                  isLoading = false;
                });
              }
            }
          },
          child: (isLoading)
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.5,
                  ))
              : Icon(
                  Icons.check,
                  color: ColorsConstants.white,
                ),
        ),
      ),
    );
  }
}
