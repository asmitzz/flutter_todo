import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/notifications/widgets/notification_card.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';

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
            constraints: const BoxConstraints(minWidth: double.infinity),
            decoration: BoxDecoration(
              color: ColorsConstants.lightRosyBrown,
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
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
