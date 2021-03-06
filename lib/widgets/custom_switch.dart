import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key, required this.text,required this.value,required this.onChange}) : super(key: key);
  final String text;
  final bool value;
  final Function onChange;
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Text(
            widget.text,
            style: TextStyle(
                fontWeight: FontsConstants.medium, color: ColorsConstants.blue),
          ),
        ),
        Flexible(
          flex: 1,
          child: Transform.scale(
              scale: 0.8,
              child: FlutterSwitch(
                width: 80.0,
                toggleSize: 35.0,
                height: 45.0,
                activeToggleColor: ColorsConstants.white,
                onToggle: (value) => widget.onChange(value),
                value: widget.value,
                activeColor: ColorsConstants.green,
                switchBorder: Border.all(color: ColorsConstants.green),
                inactiveColor: ColorsConstants.lightGrey,
              )),
        ),
      ],
    );
  }
}
