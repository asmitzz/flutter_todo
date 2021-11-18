import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/my_appbar.dart';
import 'package:flutter_todo/widgets/bottom_bar.dart';
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
      child: SafeArea(
        child: Scaffold(
          appBar:const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: MyAppBar(),
          ),
          drawer: const Drawer(),
          body: const HomeTemplate(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const BottomBar(currentIndex:0),
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
