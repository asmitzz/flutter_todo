import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/size_config.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
    onPressed: () {
      Navigator.pushNamed( context,"/new-task");
    },
    backgroundColor: ColorsConstants.blue,
    child:  Icon(Icons.add,
    size: SizeConfig.blockSizeVertical * 4,)
  );
  }
}
