import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast{
    errorToast(String msg){
      return Fluttertoast.showToast(
            msg: msg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorsConstants.error,
            textColor: ColorsConstants.white,
            fontSize: FontsConstants.base
          );
    }

    successToast(String msg){
      return Fluttertoast.showToast(
            msg: msg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorsConstants.blue,
            textColor: ColorsConstants.white,
            fontSize: FontsConstants.base
          );
    }
}