import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/size_config.dart';

Container todosHeader(String title1,String title2) {
  return Container(
    height: SizeConfig.safeBlockVertical * 24,
    constraints: const BoxConstraints(minWidth: double.infinity),
    decoration: BoxDecoration(
      color: ColorsConstants.lightRosyBrown,
    ),
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 6,
        vertical: SizeConfig.safeBlockVertical* 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: TextStyle(
              color: ColorsConstants.blue,
              fontSize: FontsConstants.lg_1,
              fontWeight: FontWeight.bold),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title2,
              style: TextStyle(
                  color: ColorsConstants.blue,
                  fontSize: FontsConstants.lg_1,
                  fontWeight: FontWeight.bold),
            ),
            Container(
                margin: const EdgeInsets.only(top: 3.0),
                width: 25.0,
                height: 3.0,
                color: ColorsConstants.blue)
          ],
        )
      ],
    ),
  );
}
