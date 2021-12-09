import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/size_config.dart';

class ButtonLoader extends StatelessWidget {
  const ButtonLoader({Key? key,required this.background}) : super(key: key);
  final Color background;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: null,
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 2,
                    horizontal: SizeConfig.blockSizeVertical * 2)),
            backgroundColor:
                MaterialStateProperty.all<Color>(background)),
        child: SizedBox(
            width: SizeConfig.blockSizeVertical * 3,
            height: SizeConfig.blockSizeVertical * 3,
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 1.5,
            )));
  }
}
