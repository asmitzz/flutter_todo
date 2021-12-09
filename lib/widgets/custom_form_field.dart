import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/size_config.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.fontSize,
      this.fontWeight,
      this.borderSide,
      this.enableBorderSide,
      this.focusedBorderSide,
      this.controller,
      this.onChanged,
      this.prefixIcon,
      this.initialValue = "",
      this.suffixIcon,
      this.obscureText = false,
      required this.validator})
      : super(key: key);

  final String? initialValue;
  final String labelText;
  final String hintText;
  final Icon? prefixIcon;
  final dynamic suffixIcon;
  final bool obscureText;
  final Function validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final BorderSide? borderSide;
  final BorderSide? enableBorderSide;
  final BorderSide? focusedBorderSide;
  final fontSize;
  final fontWeight;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return widget.controller != null
        ? TextFormField(
            onChanged: widget.onChanged,
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(
                fontWeight: widget.fontWeight ?? FontsConstants.normal,
                color: ColorsConstants.blue,
                fontSize: widget.fontSize ?? FontsConstants.base),
            obscureText: widget.obscureText,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 2,
                    horizontal: SizeConfig.blockSizeHorizontal * 3),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: SizeConfig.blockSizeHorizontal * 3),
                  child: widget.prefixIcon,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: SizeConfig.blockSizeHorizontal * 3),
                  child: widget.suffixIcon,
                ),
                border: OutlineInputBorder(
                    borderSide: widget.borderSide ??
                        BorderSide(color: ColorsConstants.blue),
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.blockSizeHorizontal * 3))),
                enabledBorder: OutlineInputBorder(
                    borderSide: widget.enableBorderSide ??
                        BorderSide(color: ColorsConstants.blue),
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.blockSizeHorizontal * 3))),
                focusedBorder: OutlineInputBorder(
                    borderSide: widget.focusedBorderSide ??
                        BorderSide(color: ColorsConstants.blue),
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.blockSizeHorizontal * 3))),
                hintText: widget.hintText,
                labelStyle: TextStyle(
                    fontWeight: FontsConstants.medium,
                    color: ColorsConstants.blue),
                labelText: widget.labelText),
            validator: (value) => widget.validator(value))
        : TextFormField(
            onChanged: widget.onChanged,
            initialValue: widget.initialValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(
                fontWeight: widget.fontWeight ?? FontsConstants.normal,
                color: ColorsConstants.blue,
                fontSize: widget.fontSize ?? FontsConstants.base),
            obscureText: widget.obscureText,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2, horizontal: SizeConfig.blockSizeHorizontal * 3),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: SizeConfig.blockSizeHorizontal * 3),
                  child: widget.prefixIcon,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: SizeConfig.blockSizeHorizontal * 3),
                  child: widget.suffixIcon,
                ),
                border: OutlineInputBorder(borderSide: widget.borderSide ?? BorderSide(color: ColorsConstants.blue), borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockSizeHorizontal * 3))),
                enabledBorder: OutlineInputBorder(borderSide: widget.enableBorderSide ?? BorderSide(color: ColorsConstants.blue), borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockSizeHorizontal * 3))),
                focusedBorder: OutlineInputBorder(borderSide: widget.focusedBorderSide ?? BorderSide(color: ColorsConstants.blue), borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockSizeHorizontal * 3))),
                hintText: widget.hintText,
                labelStyle: TextStyle(fontWeight: FontsConstants.medium, color: ColorsConstants.blue),
                labelText: widget.labelText),
            validator: (value) => widget.validator(value));
  }
}
