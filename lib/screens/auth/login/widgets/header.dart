import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "🍭",
          style: TextStyle(
              fontSize: FontsConstants.xxl, color: ColorsConstants.blue),
        ),
       SizedBox(
          height: SizeConfig.blockSizeHorizontal * 4,
        ),
        Text(
          StringsConstants.loginHeading1,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: FontsConstants.xl,
              color: ColorsConstants.blue),
        ),
        SizedBox(
          height: SizeConfig.blockSizeHorizontal * 2,
        ),
        Text(
          StringsConstants.loginHeading2,
          style: TextStyle(
              fontSize: FontsConstants.lg,
              fontWeight: FontsConstants.medium,
              color: ColorsConstants.blue),
        ),
        SizedBox(
          height: SizeConfig.blockSizeHorizontal * 2,
        ),
        Text(
          StringsConstants.loginHeading3,
          style: TextStyle(
              fontSize: FontsConstants.lg,
              fontWeight: FontsConstants.medium,
              color: ColorsConstants.blue),
        ),
        SizedBox(
          height: SizeConfig.blockSizeHorizontal * 2,
        ),
      ],
    );
  }
}
