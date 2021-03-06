import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/widgets/my_drawer.dart';
import 'package:flutter_todo/widgets/my_floating_action_button.dart';
import 'package:flutter_todo/widgets/my_appbar.dart';
import 'package:flutter_todo/widgets/my_bottom_bar.dart';
import 'package:flutter_todo/screens/profile/widgets/profile_template.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConstants.rosyBrown,
      child:  SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: MyAppBar(
              editProfile: true,
              title: StringsConstants.profile["title"],
            ),
          ),
          drawer: const MyDrawer(),
          body: const SingleChildScrollView(child: ProfileTemplate()),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const BottomBar(currentIndex: 3),
          floatingActionButton: const MyFloatingActionButton(),
        ),
      ),
    );
  }
}
