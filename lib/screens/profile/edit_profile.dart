import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/screens/profile/widgets/edit_profile_template.dart';
import 'package:flutter_todo/services/profile_services.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/widgets/toast.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        shadowColor: ColorsConstants.rosyBrown,
        backgroundColor: ColorsConstants.lightRosyBrown,
        iconTheme: IconThemeData(color: ColorsConstants.blue),
        title: Text(
          StringsConstants.editProfile["title"],
          style: TextStyle(
              color: ColorsConstants.blue,
              fontSize: FontsConstants.base,
              fontWeight: FontsConstants.bold,
              letterSpacing: 2.0),
        ),
      ),
      body: SingleChildScrollView(
          child: EditProfileTemplate(
        formKey: formKey,
        nameController: nameController,
        emailController: emailController,
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsConstants.blue,
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            setState(() {
              isLoading = true;
            });
            await ProfileServices().saveProfile(
                email: emailController.text, name: nameController.text);
            setState(() {
              isLoading = false;
            });
            navigatorKey.currentState!.pushReplacementNamed("/profile");
            return MyToast().successToast("Profile updated!!");
          }
        },
        child: (isLoading)
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1.5,
                ))
            : Icon(
                Icons.check,
                color: ColorsConstants.white,
              ),
      ),
    );
  }
}
