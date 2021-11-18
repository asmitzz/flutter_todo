import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/my_appbar.dart';
import 'package:flutter_todo/widgets/bottom_bar.dart';
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
      child: SafeArea(
        child: Scaffold(
          appBar:const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: MyAppBar(),
          ),
          drawer: const Drawer(),
          body: const SchedularTemplate(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const BottomBar(currentIndex:1),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color.fromRGBO(37, 59, 107, 1.0),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}