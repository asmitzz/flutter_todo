import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
    onPressed: () {
      Navigator.pushNamed( context,"/new-task");
    },
    backgroundColor: const Color.fromRGBO(37, 59, 107, 1.0),
    child: const Icon(Icons.add),
  );
  }
}
