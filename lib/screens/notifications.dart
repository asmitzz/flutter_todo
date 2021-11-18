import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/my_floating_action_button.dart';
import 'package:flutter_todo/utils/my_appbar.dart';
import 'package:flutter_todo/utils/my_bottom_bar.dart';
import 'package:flutter_todo/widgets/notification_template.dart';

class Notifications extends StatefulWidget {
  const Notifications({ Key? key }) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 230, 230, 1.0),
      child: const SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: MyAppBar(search: true,title: "NOTIFICATIONS",),
          ),
          drawer:  Drawer(),
          body:  NotificationsTemplate(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:  BottomBar(currentIndex:2),
          floatingActionButton: MyFloatingActionButton(),
        ),
      ),
    );
  }
}