import 'package:flutter/material.dart';

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
      shadowColor: const Color.fromRGBO(254, 224, 224, 1.0),
      backgroundColor: const Color.fromRGBO(255, 230, 230, 1.0),
      title: Text(
        widget.title,
        style: const TextStyle(
            letterSpacing: 2.0,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(37, 59, 107, 1.0)),
      ),
      actions: [
        Visibility(
          visible: widget.search,
          child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search,
                  color: Color.fromRGBO(37, 59, 107, 1.0)),
              label: const Text("")),
        ),
        Visibility(
          visible: widget.editProfile,
          child: TextButton.icon(
              onPressed: editProfile,
              icon: const Icon(Icons.edit,
                  color: Color.fromRGBO(37, 59, 107, 1.0)),
              label: const Text("")),
        )
      ],
      iconTheme: const IconThemeData(
          color: Color.fromRGBO(37, 59, 107, 1.0), size: 28.0),
    );
  }
}
