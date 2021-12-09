import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/my_drawer.dart';
import 'package:flutter_todo/widgets/my_floating_action_button.dart';
import 'package:flutter_todo/widgets/my_appbar.dart';
import 'package:flutter_todo/widgets/my_bottom_bar.dart';
import 'package:flutter_todo/screens/schedular/widgets/schedular_template.dart';

class Schedular extends StatefulWidget {
  const Schedular({Key? key}) : super(key: key);

  @override
  _SchedularState createState() => _SchedularState();
}

class _SchedularState extends State<Schedular> {
  @override
  Widget build(BuildContext context) {

    return Container(
      color: ColorsConstants.lightRosyBrown,
      child:  SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(SizeConfig.safeBlockVertical * 12),
            child: MyAppBar(
              search: true,
              title: StringsConstants.schedular["title"],
            ),
          ),
          drawer: const MyDrawer(),
          body: const SingleChildScrollView(child: SchedularTemplate()),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const BottomBar(currentIndex: 1),
          floatingActionButton: SizedBox(
              height: SizeConfig.safeBlockVertical * 10,
              width: SizeConfig.safeBlockHorizontal * 10,
              child: const FittedBox(child: MyFloatingActionButton()),
            )),
        ),
    );
  }
}
