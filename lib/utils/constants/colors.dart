import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorsConstants {
  static Color rosyBrown = const Color.fromRGBO(255, 230, 230, 1.0);
  static Color lightRosyBrown = const Color.fromRGBO(255, 238, 238, 1.0);
  static Color blue = const Color.fromRGBO(37, 59, 107, 1.0);
  static Color blueGrey = Colors.blueGrey;
  static Color green = Colors.greenAccent;
  static Color white = Colors.white;
  static Color lightGrey = Colors.grey.shade200;
  static Color error = Colors.red;
}
