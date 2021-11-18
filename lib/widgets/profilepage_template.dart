import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ProfileTemplate extends StatefulWidget {
  const ProfileTemplate({Key? key}) : super(key: key);

  @override
  _ProfileTemplateState createState() => _ProfileTemplateState();
}

class _ProfileTemplateState extends State<ProfileTemplate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromRGBO(255, 238, 238, 1.0),
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundColor: Color.fromRGBO(37, 59, 107, 1.0),
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1634926878768-2a5b3c42f139?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGF2YXRhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
                radius: 35.0,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Asmit Shrivastava",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                          color: Color.fromRGBO(37, 59, 107, 1.0)),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "asmit@gmail.com",
                      style: TextStyle(color: Color.fromRGBO(37, 59, 107, 1.0)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Notifications Settings",style: TextStyle(color:Colors.blueGrey)),
              const SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Get email notifications",style: TextStyle(fontWeight: FontWeight.w500,color:Color.fromRGBO(37, 59, 107, 1.0)),),
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
                        switchBorder: Border.all(
                          color:Colors.greenAccent
                        ),
                        inactiveColor: Colors.grey.shade200,
                      )),
                ],
              ),
              const SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Vibrate on alert",style: TextStyle(fontWeight: FontWeight.w500,color:Color.fromRGBO(37, 59, 107, 1.0))),
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
                        switchBorder: Border.all(
                          color:Colors.greenAccent
                        ),
                        inactiveColor: Colors.grey.shade200,
                      )),
                ],
              ),
              const SizedBox(height: 15.0,),
              const Text("Floss Settings",style: TextStyle(color:Colors.blueGrey)),
              const SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Share profile with other floss users",style: TextStyle(fontWeight: FontWeight.w500,color:Color.fromRGBO(37, 59, 107, 1.0))),
                  Transform.scale(
                      scale: 0.8,
                      child: FlutterSwitch(
                        width: 80.0,
                        toggleSize: 35.0,
                        height: 45.0,
                        activeToggleColor: Colors.white,
                        onToggle: (value) {},
                        value: true,
                        activeColor: Colors.greenAccent,
                        switchBorder: Border.all(
                          color:Colors.greenAccent
                        ),
                        inactiveColor: Colors.grey.shade200,
                      )),
                ],
              ),
              const SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Show your task completion status",style: TextStyle(fontWeight: FontWeight.w500,color:Color.fromRGBO(37, 59, 107, 1.0))),
                  Transform.scale(
                      scale: 0.8,
                      child: FlutterSwitch(
                        width: 80.0,
                        toggleSize: 35.0,
                        height: 45.0,
                        activeToggleColor: Colors.white,
                        onToggle: (value) {},
                        value: true,
                        activeColor: Colors.greenAccent,
                        switchBorder: Border.all(
                          color:Colors.greenAccent
                        ),
                        inactiveColor: Colors.grey.shade200,
                      )),
                ],
              ),
              const SizedBox(height: 15.0,),
            ],
          ),
        )
      ],
    );
  }
}
