import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/my_drawer.dart';
import 'package:flutter_todo/widgets/my_floating_action_button.dart';
import 'package:flutter_todo/widgets/my_appbar.dart';
import 'package:flutter_todo/widgets/my_bottom_bar.dart';
import 'package:flutter_todo/screens/notifications/widgets/notification_template.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConstants.lightRosyBrown,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(SizeConfig.safeBlockVertical * 10),
            child: MyAppBar(
              search: true,
              title: StringsConstants.notifications["title"],
            ),
          ),
          drawer: const MyDrawer(),
          body: const SingleChildScrollView(child: NotificationsTemplate()),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const BottomBar(currentIndex: 2),
          floatingActionButton: const MyFloatingActionButton(),
        ),
      ),
    );
  }
}
