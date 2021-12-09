import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todo/providers/profile.provider.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);

    return Container(
      height: SizeConfig.safeBlockVertical * 25,
      color: ColorsConstants.lightRosyBrown,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 6,
          vertical: SizeConfig.blockSizeVertical * 6),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ColorsConstants.blue,
            backgroundImage: profileProvider.photoUrl != ""
                ? NetworkImage(profileProvider.photoUrl)
                : null,
            radius: SizeConfig.blockSizeVertical * 6,
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 4,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  profileProvider.name,
                  style: TextStyle(
                      fontWeight: FontsConstants.bold,
                      fontSize: FontsConstants.md_2,
                      color: ColorsConstants.blue),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Text(
                  profileProvider.email,
                  style: TextStyle(
                      fontSize: FontsConstants.base,
                      color: ColorsConstants.blue),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
