import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/size_config.dart';

class DismissibleBackgrounds {
  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  <Widget>[
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 4,
            ),
            Icon(
              Icons.edit,
              size: SizeConfig.blockSizeHorizontal * 4,
              color: Colors.white,
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 2,
            ),
            Text(
              "Edit",
              style: TextStyle(
                color: Colors.white,
                fontSize: FontsConstants.base,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              size:SizeConfig.blockSizeHorizontal * 4,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: FontsConstants.base
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 4,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
