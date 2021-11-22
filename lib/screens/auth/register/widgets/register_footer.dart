import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({Key? key, required this.formKey}) : super(key: key);
  final GlobalKey<FormState> formKey;

  void handleSignUp() {
    if (formKey.currentState!.validate()) {
      print("submitted!");
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
          child: TextButton(
            onPressed: handleSignUp,
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
              backgroundColor: MaterialStateProperty.all(ColorsConstants.blue),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0))),
            ),
          ),
        )
      ],
    );
  }
}
