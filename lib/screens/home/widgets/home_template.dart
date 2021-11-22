import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';

class HomeTemplate extends StatefulWidget {
  const HomeTemplate({Key? key}) : super(key: key);

  @override
  _HomeTemplateState createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
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
                    StringsConstants.home["title_1"],
                    style: TextStyle(
                        color: ColorsConstants.blue,
                        fontSize: FontsConstants.lg_1,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        StringsConstants.home["title_2"],
                        style: TextStyle(
                            color: ColorsConstants.blue,
                            fontSize: FontsConstants.lg_1,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 3.0),
                          width: 25.0,
                          height: 3.0,
                          color: ColorsConstants.blue)
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                          side:  BorderSide(
                              color: ColorsConstants.green, width: 1.5),
                          value: false,
                          onChanged: (value) {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0))),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Read Type Guidelines",
                      style: TextStyle(
                          color: ColorsConstants.blue,
                          fontWeight: FontsConstants.medium),
                    )
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                          side:  BorderSide(
                              color: ColorsConstants.green, width: 1.5),
                          value: false,
                          onChanged: (value) {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0))),
                    ),
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
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                          checkColor: ColorsConstants.blue,
                          activeColor: ColorsConstants.green,
                          side:  BorderSide(
                              color: ColorsConstants.green, width: 1.5),
                          value: true,
                          onChanged: (value) {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0))),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Bring Groceries",
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
