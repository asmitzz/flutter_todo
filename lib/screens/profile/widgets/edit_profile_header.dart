import 'package:flutter/material.dart';
import 'package:flutter_todo/providers/profile.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/custom_form_field.dart';

Container editProfileHeader(ProfileProvider profileProvider) {
  return Container(
      height: SizeConfig.safeBlockVertical * 20,
      color: ColorsConstants.lightRosyBrown,
      child: CustomFormField(
        fontSize: FontsConstants.xl,
        fontWeight: FontsConstants.bold,
        borderSide: BorderSide.none,
        enableBorderSide: BorderSide.none,
        focusedBorderSide: BorderSide.none,
        initialValue: profileProvider.name,
        onChanged: (value) {
          profileProvider.updateName(value);
        },
        labelText: "",
        hintText: "Enter you name",
        validator: (String value) {
          if (value.length < 3) {
            return "Invalid name";
          }
          return null;
        },
      ));
}
