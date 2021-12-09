import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/size_config.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.safeBlockVertical * 4,
        ),
        Text(
          "Sat, Nov 30, 2021",
          style: TextStyle(
              color: ColorsConstants.blueGrey, fontSize: FontsConstants.base),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 4,
        ),
        
         Row(
          children: [
            Container(
                child: Center(
                    child: Text(
                  "i",
                  style: TextStyle(
                      fontWeight: FontsConstants.bold,
                      fontSize: FontsConstants.md,
                      color: ColorsConstants.blue),
                )),
                height: SizeConfig.blockSizeVertical * 5,
                width: SizeConfig.blockSizeHorizontal * 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: ColorsConstants.green)),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 2,
            ),
            Text(
              "Complete responsive design",
              style: TextStyle(
                  color: ColorsConstants.blue,
                  fontSize: FontsConstants.base,
                  fontWeight: FontsConstants.medium),
            )
          ],
        ),
      ],
    );
  }
}
