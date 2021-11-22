import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/constants/colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConstants.lightRosyBrown,
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ColorsConstants.blue,
            backgroundImage:
                NetworkImage(StringsConstants.profile["default_pic"]),
            radius: 35.0,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringsConstants.profile["default_name"],
                  style: TextStyle(
                      fontWeight: FontsConstants.bold,
                      fontSize: 26.0,
                      color: ColorsConstants.blue),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  StringsConstants.profile["default_email"],
                  style: TextStyle(color: ColorsConstants.blue),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
