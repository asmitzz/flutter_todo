import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/auth/register/widgets/register_footer.dart';
import 'package:flutter_todo/screens/auth/register/widgets/register_form.dart';
import 'package:flutter_todo/screens/auth/register/widgets/register_header.dart';

class RegisterTemplate extends StatefulWidget {
  const RegisterTemplate({Key? key}) : super(key: key);

  @override
  _RegisterTemplateState createState() => _RegisterTemplateState();
}

class _RegisterTemplateState extends State<RegisterTemplate> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const RegisterHeader(),
        RegisterForm(formKey:_formKey),
        RegisterFooter(formKey:_formKey)
      ],
    );
  }
}
