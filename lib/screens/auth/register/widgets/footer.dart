import 'package:flutter/material.dart';
import 'package:flutter_todo/providers/auth.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:provider/provider.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.usernameController,
      required this.nameController,
      required this.passwordController})
      : super(key: key);
  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController nameController;
  final TextEditingController passwordController;

  void handleSignUp(BuildContext context,AuthProvider authProvider) async {
    if (formKey.currentState!.validate()) {
      await authProvider.signUpWithEmailAndPassword(
          emailController: emailController,
          usernameController: usernameController,
          nameController: nameController,
          passwordController: passwordController,
          context:context
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringsConstants.register["footer_title"],
              style: TextStyle(
                  color: ColorsConstants.blue,
                  fontWeight: FontsConstants.medium,
                  fontSize: FontsConstants.md),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: Text(StringsConstants.register["login_btn"],
                    style: TextStyle(
                        color: ColorsConstants.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: FontsConstants.md)))
          ],
        ),
        FractionallySizedBox(
          widthFactor: 1.0,
          child: Consumer<AuthProvider>(
            builder: (_, authProvider, __) => TextButton(
              onPressed: () => handleSignUp(context,authProvider),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Text(
                  StringsConstants.register["sign_up_btn"],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: FontsConstants.md_1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ColorsConstants.blue),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0))),
              ),
            ),
          ),
        )
      ],
    );
  }
}
