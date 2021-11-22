import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Sat, Nov 30, 2021",
          style: TextStyle(
            color: ColorsConstants.blueGrey,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
                child: Center(
                    child: Text(
                  "i",
                  style: TextStyle(
                      fontWeight: FontsConstants.bold,
                      fontSize: FontsConstants.md_1,
                      color: ColorsConstants.blue),
                )),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: ColorsConstants.green)),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              "Complete responsive design",
              style: TextStyle(
                  color: ColorsConstants.blue,
                  fontWeight: FontsConstants.medium),
            )
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          children: [
            Container(
                child: Center(
                    child: Text(
                  "i",
                  style: TextStyle(
                      fontWeight: FontsConstants.bold,
                      fontSize: FontsConstants.md_1,
                      color: ColorsConstants.blue),
                )),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: ColorsConstants.green)),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              "Complete responsive design",
              style: TextStyle(
                  color: ColorsConstants.blue,
                  fontWeight: FontsConstants.medium),
            )
          ],
        ),
        const SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
