import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/auth/login/widgets/footer.dart';
import 'package:flutter_todo/screens/auth/login/widgets/form.dart';
import 'package:flutter_todo/screens/auth/login/widgets/header.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/size_config.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstants.rosyBrown,
        body: LayoutBuilder(
          builder:(context,viewportConstraints) =>  SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const LoginHeader(),
                    LoginForm(
                        formKey: _formKey,
                        emailController: emailController,
                        passwordController: passwordController),
                    LoginFooter(
                        formKey: _formKey,
                        emailController: emailController,
                        passwordController: passwordController)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
