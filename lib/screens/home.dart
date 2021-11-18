import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/my_floating_action_button.dart';
import 'package:flutter_todo/utils/my_appbar.dart';
import 'package:flutter_todo/utils/my_bottom_bar.dart';
import 'package:flutter_todo/widgets/home_template.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 230, 230, 1.0),
      child: const SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: MyAppBar(search: true,),
          ),
          drawer:  Drawer(),
          body:  HomeTemplate(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:  BottomBar(currentIndex:0),
          floatingActionButton: MyFloatingActionButton()
        ),
      ),
    );
  }
}
