import 'package:flutter/material.dart';

mySnackBar({BuildContext? context,String content = "",Color backgroundColor = Colors.black87}){
   if(context != null){
     return ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content:Text(content),
          backgroundColor:backgroundColor,
     ));
   }
}