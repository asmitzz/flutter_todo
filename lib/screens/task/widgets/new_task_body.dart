import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/widgets/custom_switch.dart';

class NewTaskBody extends StatefulWidget {
  const NewTaskBody({Key? key}) : super(key: key);

  @override
  _NewTaskBodyState createState() => _NewTaskBodyState();
}

class _NewTaskBodyState extends State<NewTaskBody> {
  String task = "Write here...";
  DateTime selectedDate = DateTime.now();
 
 
 _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 40.0),
          color: ColorsConstants.rosyBrown,
          child: EditableText(
            focusNode: FocusNode(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: FontsConstants.xl,
                color: ColorsConstants.blue),
            cursorColor: ColorsConstants.blue,
            backgroundCursorColor: ColorsConstants.blue,
            controller: TextEditingController(text: task),
            onChanged: (value) => setState(() {
              task = value;
            }),
            maxLines: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(StringsConstants.newTask["select_date"],
                  style: TextStyle(
                      color: ColorsConstants.blue,
                      fontWeight: FontsConstants.medium)),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 2, color: Colors.blueGrey)),
                alignment: Alignment.topLeft,
                width: double.infinity,
                child: TextButton(
                    onPressed: () => _selectDate(context),
                    child:Text(
                      "${selectedDate.year.toString()}-${selectedDate.month.toString()}-${selectedDate.day.toString()}",
                      style: TextStyle(color: ColorsConstants.blue),
                    )),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Text("More Options",
                  style: TextStyle(color: ColorsConstants.blueGrey)),
              const SizedBox(
                height: 15.0,
              ),
              CustomSwitch(text: StringsConstants.newTaskOptions["option_1"]),
              const SizedBox(
                height: 15,
              ),
              CustomSwitch(text: StringsConstants.newTaskOptions["option_2"])
            ],
          ),
        )
      ],
    );
  }
}
