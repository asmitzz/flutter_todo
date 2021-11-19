import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/my_drawer.dart';
import 'package:flutter_todo/utils/my_floating_action_button.dart';
import 'package:flutter_todo/utils/my_appbar.dart';
import 'package:flutter_todo/utils/my_bottom_bar.dart';
import 'package:flutter_todo/widgets/profilepage_template.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:  const Color.fromRGBO(255, 230, 230, 1.0),
      child: const SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: MyAppBar(editProfile: true,title: "PROFILE",),
          ),
          drawer:  MyDrawer(),
          body:  ProfileTemplate(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:  BottomBar(currentIndex:3),
          floatingActionButton: MyFloatingActionButton(),
        ),
      ),
    );
  }
}
