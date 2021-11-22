import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/widgets/custom_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool showPassword = true;
  bool showConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomFormField(
              labelText: StringsConstants.registerForm["field_1_label_text"],
              hintText: StringsConstants.registerForm["field_1_hint_text"],
              prefixIcon: Icon(
                Icons.person,
                color: ColorsConstants.blue,
              ),
              validator: (value) {
                return ((value != null && value.length < 5)
                    ? StringsConstants.registerForm["field_1_error_text"]
                    : null);
              }),
          const SizedBox(
            height: 20.0,
          ),
          CustomFormField(
              labelText: StringsConstants.registerForm["field_2_label_text"],
              hintText: StringsConstants.registerForm["field_2_hint_text"],
              prefixIcon: Icon(
                Icons.lock,
                color: ColorsConstants.blue,
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                      color: ColorsConstants.blue),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  }),
              obscureText: showPassword,
              validator: (value) {
                return ((value != null && value.length < 8)
                    ? StringsConstants.registerForm["field_2_error_text"]
                    : null);
              }),
          const SizedBox(
            height: 20.0,
          ),
          CustomFormField(
              labelText: StringsConstants.registerForm["field_3_label_text"],
              hintText: StringsConstants.registerForm["field_3_hint_text"],
              prefixIcon: Icon(
                Icons.lock,
                color: ColorsConstants.blue,
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                      showConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: ColorsConstants.blue),
                  onPressed: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  }),
              obscureText: showConfirmPassword,
              validator: (value) {
                return ((value != null && value.length < 8)
                    ? StringsConstants.registerForm["field_3_error_text"]
                    : null);
              }),
        ],
      ),
    );
  }
}
