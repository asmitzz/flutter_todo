import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/constants/colors.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {

    final User? currentUser = FirebaseAuth.instance.currentUser;
    final String email = currentUser!.email == null ? "" : currentUser.email.toString();
    final String name = currentUser.displayName == null ? "" : currentUser.displayName.toString();
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
                  name,
                  style: TextStyle(
                      fontWeight: FontsConstants.bold,
                      fontSize: 26.0,
                      color: ColorsConstants.blue),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  email,
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
