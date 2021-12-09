import 'package:flutter/material.dart';
import 'package:flutter_todo/providers/todos.provider.dart';
import 'package:flutter_todo/screens/task/widgets/new_task_body.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:provider/provider.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  Future<void> _onPressed() async {
    final todosProvider = Provider.of<TodoProvider>(context, listen: false);
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
  }

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.safeBlockVertical * 12),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal),
            decoration: BoxDecoration(boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ], color: ColorsConstants.rosyBrown),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  elevation: 0,
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
              ],
            ),
          ),
        ),
        body: const SingleChildScrollView(child: NewTaskBody()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: SizeConfig.safeBlockVertical * 10,
          width: SizeConfig.safeBlockHorizontal * 10,
          child: FloatingActionButton(
            backgroundColor: ColorsConstants.blue,
            onPressed: _onPressed,
            child: (isLoading)
                ? SizedBox(
                    height: SizeConfig.safeBlockVertical * 3,
                    width: SizeConfig.safeBlockHorizontal * 3,
                    child: CircularProgressIndicator(
                      color: ColorsConstants.white,
                      strokeWidth: 1.5,
                    ))
                : Icon(
                    Icons.check,
                    color: ColorsConstants.white,
                  ),
          ),
        ),
      ),
    );
  }
}
