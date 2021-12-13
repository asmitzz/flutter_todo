import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/size_config.dart';

class MyAppBar extends StatefulWidget {
  final String title;
  final bool search;
  final bool editProfile;

  const MyAppBar(
      {Key? key,
      this.title = "TO-DO",
      this.search = false,
      this.editProfile = false})
      : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  void editProfile() async {
    navigatorKey.currentState!.pushNamed("/editprofile");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: const <BoxShadow>[
        BoxShadow(
            color: Colors.black12, blurRadius: 15.0, offset: Offset(0.0, 0.75))
      ], color: ColorsConstants.rosyBrown),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: SizeConfig.safeBlockHorizontal * 5,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          elevation: 0,
          centerTitle: true,
          shadowColor: ColorsConstants.rosyBrown,
          backgroundColor: ColorsConstants.rosyBrown,
          title: Text(
            widget.title,
            style: TextStyle(
                letterSpacing: 2.0,
                fontSize: FontsConstants.base,
                fontWeight: FontsConstants.bold,
                color: ColorsConstants.blue),
          ),
          actions: [
            Visibility(
              visible: widget.search,
              child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.search,
                      size: SizeConfig.safeBlockHorizontal * 5,
                      color: ColorsConstants.blue),
                  label: const Text("")),
            ),
            Visibility(
              visible: widget.editProfile,
              child: TextButton.icon(
                  onPressed: editProfile,
                  icon: Icon(Icons.edit,
                      size: SizeConfig.safeBlockHorizontal * 5,
                      color: ColorsConstants.blue),
                  label: const Text("")),
            )
          ],
          iconTheme: IconThemeData(color: ColorsConstants.blue, size: 28.0),
        ),
      ]),
    );
  }
}
