import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String task = "Write here...";
  String email = "example@gmail.com";

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        shadowColor: const Color.fromRGBO(254, 224, 224, 1.0),
        backgroundColor: const Color.fromRGBO(255, 230, 230, 1.0),
        iconTheme: const IconThemeData(color: Color.fromRGBO(37, 59, 107, 1.0)),
        title: const Text(
          "NEW TASK",
          style: TextStyle(
              color: Color.fromRGBO(37, 59, 107, 1.0),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 40.0),
            color: const Color.fromRGBO(255, 238, 238, 1.0),
            child: EditableText(
              focusNode: FocusNode(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Color.fromRGBO(37, 59, 107, 1.0)),
              cursorColor: const Color.fromRGBO(37, 59, 107, 1.0),
              backgroundCursorColor: Colors.black,
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
                const Text("Complete by",
                    style: TextStyle(
                        color: Color.fromRGBO(
                          37,
                          59,
                          107,
                          1.0,
                        ),
                        fontWeight: FontWeight.w500)),
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
                      child: Text(
                        selectedDate.toString(),
                        style: const TextStyle(
                            color: Color.fromRGBO(37, 59, 107, 1.0)),
                      )),
                ),
                const SizedBox(height: 25.0,),
                const Text("More Options",
                    style: TextStyle(color: Colors.blueGrey)),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Save as alarms",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(37, 59, 107, 1.0)),
                    ),
                    Transform.scale(
                        scale: 0.8,
                        child: FlutterSwitch(
                          width: 80.0,
                          toggleSize: 35.0,
                          height: 45.0,
                          activeToggleColor: Colors.white,
                          onToggle: (value) {},
                          value: false,
                          activeColor: Colors.greenAccent,
                          switchBorder: Border.all(color: Colors.greenAccent),
                          inactiveColor: Colors.grey.shade200,
                        )),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Save as notifications",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 59, 107, 1.0))),
                    Transform.scale(
                        scale: 0.8,
                        child: FlutterSwitch(
                          width: 80.0,
                          toggleSize: 35.0,
                          height: 45.0,
                          activeToggleColor: Colors.white,
                          onToggle: (value) {},
                          value: false,
                          activeColor: Colors.greenAccent,
                          switchBorder: Border.all(color: Colors.greenAccent),
                          inactiveColor: Colors.grey.shade200,
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(
          37,
          59,
          107,
          1.0,
        ),
        onPressed: () {},
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
