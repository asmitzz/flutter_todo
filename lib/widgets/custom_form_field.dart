import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.controller,
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
  final TextEditingController controller;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller:widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: ColorsConstants.blue),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsConstants.blue),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsConstants.blue),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsConstants.blue),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            hintText: widget.hintText,
            labelStyle: TextStyle(
                fontWeight: FontsConstants.medium, color: ColorsConstants.blue),
            labelText: widget.labelText),
        validator: (value) => widget.validator(value));
  }
}
