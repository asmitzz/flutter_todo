import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/notifications/widgets/notification_card.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';

class NotificationsTemplate extends StatefulWidget {
  const NotificationsTemplate({Key? key}) : super(key: key);

  @override
  _NotificationsTemplateState createState() => _NotificationsTemplateState();
}

class _NotificationsTemplateState extends State<NotificationsTemplate> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: SizeConfig.safeBlockVertical * 25,
            constraints: const BoxConstraints(minWidth: double.infinity),
            decoration: BoxDecoration(
              color: ColorsConstants.lightRosyBrown,
            ),
            padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 6,
            vertical: SizeConfig.blockSizeVertical * 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  StringsConstants.notifications["title_1"],
                  style: TextStyle(
                      color: ColorsConstants.blue,
                      fontSize: FontsConstants.lg_1,
                      fontWeight: FontsConstants.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Text(
                      StringsConstants.notifications["title_2"],
                      style: TextStyle(
                          color: ColorsConstants.blue,
                          fontSize: FontsConstants.lg_1,
                          fontWeight: FontsConstants.bold),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 3.0),
                        width: 25.0,
                        height: 3.0,
                        color:  ColorsConstants.blue)
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 6,
            vertical: SizeConfig.blockSizeVertical * 2),
            child: Column(
              children: const [
                NotificationCard()
              ],
            ),
          )
        ],
      ),
    );
  }
}
