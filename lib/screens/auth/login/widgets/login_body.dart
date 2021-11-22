import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/auth/login/widgets/login_footer.dart';
import 'package:flutter_todo/screens/auth/login/widgets/login_form.dart';
import 'package:flutter_todo/screens/auth/login/widgets/login_header.dart';

class LoginTemplate extends StatefulWidget {
  const LoginTemplate({Key? key}) : super(key: key);

  @override
  _LoginTemplateState createState() => _LoginTemplateState();
}

class _LoginTemplateState extends State<LoginTemplate> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const LoginHeader(),
        LoginForm(formKey:_formKey),
        LoginFooter(formKey:_formKey)
      ],
    );
  }
}
