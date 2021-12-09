import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/custom_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController})
      : super(key: key);
  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomFormField(
              fontSize: SizeConfig.blockSizeHorizontal * 4,
                controller: widget.emailController,
                labelText: StringsConstants.registerFormField1Label,
                hintText: StringsConstants.registerFormField1Hint,
                prefixIcon: Icon(
                  Icons.email,
                  size:SizeConfig.blockSizeHorizontal * 4,
                  color: ColorsConstants.blue,
                ),
                validator: (value) {
                  return (!(RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value))
                      ? StringsConstants.registerFormField1Error
                      : null);
                }),
           SizedBox(
              height: SizeConfig.blockSizeHorizontal * 4,
            ),
            CustomFormField(
              fontSize: SizeConfig.blockSizeHorizontal * 4,
                controller: widget.passwordController,
                labelText: StringsConstants.registerFormField2Label,
                hintText: StringsConstants.registerFormField2Hint,
                prefixIcon: Icon(
                  Icons.lock,
                  size: SizeConfig.blockSizeHorizontal * 4,
                  color: ColorsConstants.blue,
                ),
                suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility,
                        color: ColorsConstants.blue,
                        size: SizeConfig.blockSizeHorizontal * 4,
                        ),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    }),
                obscureText: showPassword,
                validator: (value) {
                  return ((value != null && value.length < 8)
                      ? StringsConstants.registerFormField2Error
                      : null);
                }),
          ],
        ),
    );
  }
}
