import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
    onPressed: () {
      Navigator.pushNamed( context,"/new-task");
    },
    backgroundColor: ColorsConstants.blue,
    child: const Icon(Icons.add),
  );
  }
}
