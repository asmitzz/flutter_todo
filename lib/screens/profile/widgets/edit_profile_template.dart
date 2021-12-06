import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/custom_form_field.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';

class EditProfileTemplate extends StatefulWidget {
  const EditProfileTemplate(
      {Key? key,
      required this.getFromGallery,
      required this.formKey,
      required this.emailController,
      required this.nameController})
      : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final Function getFromGallery;
  @override
  _EditProfileTemplateState createState() => _EditProfileTemplateState();
}

class _EditProfileTemplateState extends State<EditProfileTemplate> {
  @override
  Widget build(BuildContext context) {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    final String email =
        currentUser!.email == null ? "" : currentUser.email.toString();
    final String displayName = currentUser.displayName == null
        ? "Full Name..."
        : currentUser.displayName.toString();

    widget.nameController.text = displayName;
    widget.emailController.text = email;

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 40.0),
            color: ColorsConstants.lightRosyBrown,
            child: EditableText(
              focusNode: FocusNode(),
              style: TextStyle(
                  fontWeight: FontsConstants.bold,
                  fontSize: FontsConstants.xl,
                  color: ColorsConstants.blue),
              cursorColor: ColorsConstants.blue,
              backgroundCursorColor: ColorsConstants.blue,
              controller: widget.nameController,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                CustomFormField(
                  controller: widget.emailController,
                  labelText: "Email address",
                  hintText: "Enter you email",
                  validator: (value) {
                    if (!value!.contains("@")) {
                      return "Invalid email";
                    }
                    return null;
                  },
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.getFromGallery();
            },
            child: const Text("UPLOAD PROFILE PIC"),
          )
        ],
      ),
    );
  }
}
