import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/custom_switch.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/strings.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  bool emailNotification = false;
  bool vibrateOnAlert = false;
  bool shareProfile = false;
  bool showTask = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 6,
          vertical: SizeConfig.blockSizeVertical * 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Notifications Settings",
            style: TextStyle(
                fontSize: FontsConstants.base,
                color: ColorsConstants.blueGrey)),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        CustomSwitch(
            value: emailNotification,
            onChange: (value) {
              setState(() {
                emailNotification = value;
              });
            },
            text: StringsConstants.profileOptions["option_1"]),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        CustomSwitch(
            value: vibrateOnAlert,
            onChange: (value) {
              setState(() {
                vibrateOnAlert = value;
              });
            },
            text: StringsConstants.profileOptions["option_2"]),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        Text("Floss Settings",
            style: TextStyle(
                fontSize: FontsConstants.base,
                color: ColorsConstants.blueGrey)),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        CustomSwitch(
            value: shareProfile,
            onChange: (value) {
              setState(() {
                shareProfile = value;
              });
            },
            text: StringsConstants.profileOptions["option_3"]),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 2,
        ),
        CustomSwitch(
            value: showTask,
            onChange: (value) {
              setState(() {
                showTask = value;
              });
            },
            text: StringsConstants.profileOptions["option_4"]),
      ]),
    );
  }
}
