import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/auth/register/widgets/footer.dart';
import 'package:flutter_todo/screens/auth/register/widgets/form.dart';
import 'package:flutter_todo/screens/auth/register/widgets/header.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/size_config.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstants.rosyBrown,
        body: LayoutBuilder(
          builder:(context,viewportConstraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                const RegisterHeader(),
                RegisterForm(
                    formKey: _formKey,
                    emailController: emailController,
                    usernameController: usernameController,
                    nameController: nameController,
                    passwordController: passwordController),
                RegisterFooter(
                    formKey: _formKey,
                    emailController: emailController,
                    usernameController: usernameController,
                    nameController: nameController,
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
