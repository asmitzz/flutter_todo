import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/size_config.dart';

class BottomBar extends StatefulWidget {
  final dynamic currentIndex;

  const BottomBar({Key? key, this.currentIndex}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void _onTap(context, index) {
    if (widget.currentIndex == index) return;
    if (index == 0) Navigator.pushReplacementNamed(context, "/home");
    if (index == 1) Navigator.pushReplacementNamed(context, "/schedular");
    if (index == 2) Navigator.pushReplacementNamed(context, "/notifications");
    if (index == 3) Navigator.pushReplacementNamed(context, "/profile");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.safeBlockVertical * 10,
      child: BottomNavigationBar(
        
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Column(
              children: [
                 Icon(
                  Icons.list,
                  color: ColorsConstants.blue,
                  size: SizeConfig.blockSizeHorizontal * 5,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    width: 40.0,
                    height: 3.0,
                    color: widget.currentIndex == 0
                        ?  ColorsConstants.blue
                        :  ColorsConstants.rosyBrown)
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                 Icon(
                  Icons.schedule,
                  color: ColorsConstants.blue,
                  size: SizeConfig.blockSizeHorizontal * 5,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    width: 40.0,
                    height: 3.0,
                    color: widget.currentIndex == 1
                        ?  ColorsConstants.blue
                        :  ColorsConstants.rosyBrown)
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                 Icon(
                  Icons.notifications_outlined,
                  color: ColorsConstants.blue,
                  size: SizeConfig.blockSizeHorizontal * 5,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    width: 40.0,
                    height: 3.0,
                    color: widget.currentIndex == 2
                        ?  ColorsConstants.blue
                        :  ColorsConstants.rosyBrown)
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                 Icon(
                  Icons.person_outline,
                  color: ColorsConstants.blue,
                  size: SizeConfig.blockSizeHorizontal * 5,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    width: 40.0,
                    height: 3.0,
                    color: widget.currentIndex == 3
                        ?  ColorsConstants.blue
                        :  ColorsConstants.rosyBrown)
              ],
            ),
            label: "",
          ),
        ],
        backgroundColor: ColorsConstants.lightRosyBrown,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) => _onTap(context, index),
        iconSize: 40,
        elevation: 0,
        selectedFontSize: 0,
      ),
    );
  }
}
