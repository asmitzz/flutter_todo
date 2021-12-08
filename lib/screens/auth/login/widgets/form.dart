import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/widgets/custom_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController})
      : super(key: key);
  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomFormField(
              controller: widget.emailController,
              labelText: StringsConstants.loginFormField1Label,
              hintText: StringsConstants.loginFormField1Hint,
              prefixIcon: Icon(
                Icons.email,
                color: ColorsConstants.blue,
              ),
              validator: (value) {
                return (value != null && value.length < 5)
                    ? StringsConstants.loginFormField1Error
                    : null;
              }),
          const SizedBox(
            height: 20.0,
          ),
          CustomFormField(
              controller: widget.passwordController,
              labelText: StringsConstants.loginFormField2Label,
              hintText: StringsConstants.loginFormField2Hint,
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
                    ? StringsConstants.loginFormField2Error
                    : null);
              }),
        ],
      ),
    );
  }
}
