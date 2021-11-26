import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/custom_switch.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/strings.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Notifications Settings",
              style: TextStyle(color: ColorsConstants.blueGrey)),
          const SizedBox(
            height: 15.0,
          ),
          CustomSwitch(value:false,onChange: (value){print(value);},text: StringsConstants.profileOptions["option_1"]),
          const SizedBox(
            height: 15.0,
          ),
          CustomSwitch(value:false,onChange: (value){print(value);},text: StringsConstants.profileOptions["option_2"]),
          const SizedBox(
            height: 15.0,
          ),
          Text("Floss Settings",
              style: TextStyle(color: ColorsConstants.blueGrey)),
          const SizedBox(
            height: 15.0,
          ),
          CustomSwitch(value:false,onChange: (value){print(value);},text: StringsConstants.profileOptions["option_3"]),
          const SizedBox(
            height: 15.0,
          ),
          CustomSwitch(value:false,onChange: (value){print(value);},text: StringsConstants.profileOptions["option_4"]),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
