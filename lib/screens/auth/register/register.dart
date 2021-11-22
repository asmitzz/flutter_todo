import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/auth/register/widgets/register_body.dart';
import 'package:flutter_todo/utils/constants/colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstants.rosyBrown,
        body: const Padding(
          padding:  EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0),
          child: RegisterTemplate()
        ),
      ),
    );
  }
}
