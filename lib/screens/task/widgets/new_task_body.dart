import 'package:flutter/material.dart';
import 'package:flutter_todo/providers/todos.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/custom_switch.dart';
import 'package:provider/provider.dart';

class NewTaskBody extends StatefulWidget {
  const NewTaskBody({Key? key}) : super(key: key);

  @override
  _NewTaskBodyState createState() => _NewTaskBodyState();
}

class _NewTaskBodyState extends State<NewTaskBody> {
  _selectDate(BuildContext context, TodoProvider todosProvider) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: todosProvider.completedBy,
      firstDate: todosProvider.completedBy,
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != todosProvider.completedBy) {
      todosProvider.updateCompletedBy(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodoProvider>(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 6),
          color: ColorsConstants.rosyBrown,
          child: Form(
            key: todosProvider.formKey,
            child: TextFormField(
              autofocus: true,
              initialValue: todosProvider.title,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  hintText: "Write Text here...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: FontsConstants.md_2,
                  color: ColorsConstants.blue),
              cursorColor: ColorsConstants.blue,
              onChanged: (value) {
                todosProvider.updateTitle(value);
              },
              maxLines: 2,
              validator: (value) {
                return (value != null && value.isEmpty
                    ? "Please enter text"
                    : null);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(StringsConstants.newTaskCompletedBy,
                  style: TextStyle(
                      color: ColorsConstants.blueGrey,
                      fontSize: FontsConstants.sm,
                      fontWeight: FontsConstants.medium)),
              const SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () => _selectDate(context, todosProvider),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:SizeConfig.blockSizeHorizontal * 2,vertical: SizeConfig.blockSizeVertical * 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 2, color: ColorsConstants.blueGrey)),
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  child: Text(
                    "${todosProvider.completedBy.year.toString()}-${todosProvider.completedBy.month.toString()}-${todosProvider.completedBy.day.toString()}",
                    style: TextStyle(color: ColorsConstants.blue, fontSize: FontsConstants.sm,),
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Text(StringsConstants.newTaskMoreOptions,
                  style: TextStyle(color: ColorsConstants.blueGrey, fontSize: FontsConstants.sm,)),
             SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              CustomSwitch(
                  value: todosProvider.saveAsAlarm,
                  onChange: (value) {
                    todosProvider.updateSaveAsAlarm(value);
                  },
                  text: StringsConstants.newTaskOption1),
             SizedBox(
                height: SizeConfig.blockSizeVertical * 3,
              ),
              CustomSwitch(
                  value: todosProvider.saveAsNotifications,
                  onChange: (value) {
                    todosProvider.updateSaveAsNotifications(value);
                  },
                  text: StringsConstants.newTaskOption2)
            ],
          ),
        )
      ],
    );
  }
}
