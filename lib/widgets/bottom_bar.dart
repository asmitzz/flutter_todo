import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final dynamic currentIndex;

  const BottomBar({Key? key, this.currentIndex}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void _onTap(context, index) {
    if (widget.currentIndex == index) return;
    if (index == 0) Navigator.pushReplacementNamed(context, "/");
    if (index == 1) Navigator.pushReplacementNamed(context, "/schedular");
    if (index == 2) Navigator.pushReplacementNamed(context, "/notifications");
    if (index == 3) Navigator.pushReplacementNamed(context, "/profile");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
            color: Color.fromRGBO(37, 59, 107, 1.0),
            size: 28.0,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.schedule,
            color: Color.fromRGBO(37, 59, 107, 1.0),
            size: 25.0,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_none,
            color: Color.fromRGBO(37, 59, 107, 1.0),
            size: 25.0,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            color: Color.fromRGBO(37, 59, 107, 1.0),
            size: 28.0,
          ),
          label: "",
        ),
      ],
      backgroundColor: const Color.fromRGBO(255, 238, 238, 1.0),
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (index) => _onTap(context, index),
      iconSize: 40,
      elevation: 0,
      selectedFontSize: 0,
    );
  }
}
