import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/notifications/widgets/notification_card.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/todos_header.dart';

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
          todosHeader(StringsConstants.notificationsTitle1,StringsConstants.notificationsTitle2),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 6,
                vertical: SizeConfig.blockSizeVertical * 2),
            child: Column(
              children: const [NotificationCard()],
            ),
          )
        ],
      ),
    );
  }
}
