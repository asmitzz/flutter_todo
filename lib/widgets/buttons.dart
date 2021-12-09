import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/size_config.dart';

ElevatedButton customButton({required icon,required onPressed, required text,required background}) {
  return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: SizeConfig.blockSizeHorizontal * 3,
      ),
      label: Text(text, style: TextStyle(fontSize: FontsConstants.sm)),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 2,
                horizontal: SizeConfig.blockSizeVertical * 2)),
        backgroundColor:
            MaterialStateProperty.all<Color>(background),
      ));
}
