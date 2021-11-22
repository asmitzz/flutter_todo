import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "🍭",
          style: TextStyle(
              fontSize: FontsConstants.xl_2, color: ColorsConstants.blue),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          StringsConstants.register["heading_1"],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: FontsConstants.xl,
              color: ColorsConstants.blue),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          StringsConstants.register["heading_2"],
          style: TextStyle(
              fontSize: FontsConstants.lg,
              fontWeight: FontsConstants.medium,
              color: ColorsConstants.blue),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          StringsConstants.register["heading_3"],
          style: TextStyle(
              fontSize: FontsConstants.lg,
              fontWeight: FontsConstants.medium,
              color: ColorsConstants.blue),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
