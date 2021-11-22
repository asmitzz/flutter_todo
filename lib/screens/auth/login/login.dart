import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/auth/login/widgets/login_body.dart';
import 'package:flutter_todo/utils/constants/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstants.rosyBrown,
        body: const Padding(
          padding:  EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0),
          child: LoginTemplate()
        ),
      ),
    );
  }
}
