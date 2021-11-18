import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/my_floating_action_button.dart';
import 'package:flutter_todo/utils/my_appbar.dart';
import 'package:flutter_todo/utils/my_bottom_bar.dart';
import 'package:flutter_todo/widgets/schedular_template.dart';

class Schedular extends StatefulWidget {
  const Schedular({ Key? key }) : super(key: key);

  @override
  _SchedularState createState() => _SchedularState();
}

class _SchedularState extends State<Schedular> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 230, 230, 1.0),
      child: const SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: MyAppBar(search: true,title: "SCHEDULAR",),
          ),
          drawer:  Drawer(),
          body:  SchedularTemplate(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:  BottomBar(currentIndex:1),
          floatingActionButton: MyFloatingActionButton(),
        ),
      ),
    );
  }
}