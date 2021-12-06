import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/screens/profile/widgets/edit_profile_template.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/widgets/toast.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");

  late File imageFile;

  getFromGallery() async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("error ${e.toString()}");
    }
  }

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
        getFromGallery: getFromGallery,
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsConstants.blue,
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await FirebaseAuth.instance.currentUser!
                .updateDisplayName(nameController.text);
            await FirebaseAuth.instance.currentUser!
                .updateEmail(emailController.text);
            navigatorKey.currentState!.pushNamed("/profile");
            return MyToast().successToast("Profile updated!!");
          }
        },
        child: Icon(
          Icons.check,
          color: ColorsConstants.white,
        ),
      ),
    );
  }
}
