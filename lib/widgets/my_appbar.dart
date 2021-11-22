import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';

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
    await Navigator.pushNamed(context, "/editprofile");
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shadowColor: ColorsConstants.rosyBrown,
      backgroundColor: ColorsConstants.rosyBrown,
      title: Text(
        widget.title,
        style:  TextStyle(
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
                  color: ColorsConstants.blue),
              label: const Text("")),
        ),
        Visibility(
          visible: widget.editProfile,
          child: TextButton.icon(
              onPressed: editProfile,
              icon: Icon(Icons.edit,
                  color: ColorsConstants.blue),
              label: const Text("")),
        )
      ],
      iconTheme: IconThemeData(
          color: ColorsConstants.blue, size: 28.0),
    );
  }
}
