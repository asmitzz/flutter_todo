import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
    shadowColor: const Color.fromRGBO(254, 224, 224, 1.0),
    backgroundColor: const Color.fromRGBO(255, 230, 230, 1.0),
    title: const Text(
      "TO-DO",
      style: TextStyle(
          letterSpacing: 2.0,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(37, 59, 107, 1.0)),
    ),
    actions: [
      TextButton.icon(
          onPressed: () {},
          icon:
              const Icon(Icons.search, color: Color.fromRGBO(37, 59, 107, 1.0)),
          label: const Text(""))
    ],
    iconTheme: const IconThemeData(
        color: Color.fromRGBO(37, 59, 107, 1.0), size: 28.0),
  );
  }
}
AppBar myAppBar() {
  return AppBar(
    leading: const Icon(Icons.menu_rounded),
    shadowColor: const Color.fromRGBO(254, 224, 224, 1.0),
    backgroundColor: const Color.fromRGBO(255, 230, 230, 1.0),
    title: const Text(
      "TO-DO",
      style: TextStyle(
          letterSpacing: 2.0,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(37, 59, 107, 1.0)),
    ),
    actions: [
      TextButton.icon(
          onPressed: () {},
          icon:
              const Icon(Icons.search, color: Color.fromRGBO(37, 59, 107, 1.0)),
          label: const Text(""))
    ],
    iconTheme: const IconThemeData(
        color: Color.fromRGBO(37, 59, 107, 1.0), size: 28.0),
  );
}
