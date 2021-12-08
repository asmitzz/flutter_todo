import 'package:flutter/material.dart';
import 'package:flutter_todo/providers/auth.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:provider/provider.dart';

class RegisterFooter extends StatefulWidget {
  const RegisterFooter(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController})
      : super(key: key);
  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<RegisterFooter> createState() => _RegisterFooterState();
}

class _RegisterFooterState extends State<RegisterFooter> {
  bool isLoading = false;

  void handleSignUp(BuildContext context, AuthProvider authProvider) async {
    if (widget.formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await authProvider.signUpWithEmailAndPassword(
        email: widget.emailController.text,
        password: widget.passwordController.text,
      );
    
      setState(() {
        isLoading = false;
      });
      
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
              StringsConstants.registerFooterTitle,
              style: TextStyle(
                  color: ColorsConstants.blue,
                  fontWeight: FontsConstants.medium,
                  fontSize: FontsConstants.md),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: Text(StringsConstants.registerBtn1,
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
              onPressed: () => handleSignUp(context, authProvider),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: (isLoading)
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.5,
                        ))
                    : Text(
                        StringsConstants.registerBtn2,
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
