import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/services/image_picker_services.dart';
import 'package:flutter_todo/services/profile_services.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/custom_form_field.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/widgets/toast.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileTemplate extends StatefulWidget {
  const EditProfileTemplate(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.nameController})
      : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController nameController;

  @override
  _EditProfileTemplateState createState() => _EditProfileTemplateState();
}

class _EditProfileTemplateState extends State<EditProfileTemplate> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      final String email =
          currentUser!.email == null ? "" : currentUser.email.toString();
      final String displayName = currentUser.displayName == null
          ? "Full Name..."
          : currentUser.displayName.toString();

      widget.nameController.text = displayName;
      widget.emailController.text = email;
      imageUrl = await ProfileServices().getProfilePicUrl();
      setState(() {});
    });
    super.initState();
  }

  String imageUrl = "";
  bool isUploadBtnLoading = false;
  bool isRemoveBtnLoading = false;

  uploadProfilePic(XFile pickedFile) async {
    setState(() {
      isUploadBtnLoading = true;
    });

    try {
      imageUrl = await ProfileServices().uploadProfilePic(pickedFile);
      isUploadBtnLoading = false;
      setState(() {});
      return MyToast().successToast("Profile pic updated!!");
    } catch (e) {
      setState(() {
        isUploadBtnLoading = false;
      });
      return MyToast().errorToast(e.toString());
    }
  }

  deleteProfilePic() async {
    setState(() {
      isRemoveBtnLoading = true;
    });
    try {
      await ProfileServices().deleteProfilePic();
      imageUrl = StringsConstants.profile["default_pic"];
      isRemoveBtnLoading = false;
      setState(() {});
      return MyToast().successToast("Profile pic removed!!");
    } catch (e) {
      setState(() {
        isRemoveBtnLoading = false;
      });
      return MyToast().errorToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        navigatorKey.currentState!.pushReplacementNamed("/profile");
        return true;
      },
      child: Form(
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
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorsConstants.blue,
                        backgroundImage:
                            imageUrl != "" ? NetworkImage(imageUrl) : null,
                        radius: 35.0,
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 4,
                      ),
                      (isRemoveBtnLoading == false
                          ? ElevatedButton.icon(
                              onPressed: deleteProfilePic,
                              icon: const Icon(
                                Icons.delete,
                                size: 16.0,
                              ),
                              label: Text("REMOVE",
                                  style:
                                      TextStyle(fontSize: FontsConstants.sm)),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorsConstants.error),
                              ))
                          : ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          ColorsConstants.error)),
                              child: const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1.5,
                                  )))),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 2,
                      ),
                      (isUploadBtnLoading == false
                          ? ElevatedButton.icon(
                              onPressed: () => ImagePickerServices()
                                  .getFromGallery(uploadProfilePic),
                              icon: const Icon(
                                Icons.edit,
                                size: 16.0,
                              ),
                              label: Text("UPLOAD",
                                  style:
                                      TextStyle(fontSize: FontsConstants.sm)),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorsConstants.blue),
                              ))
                          : ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          ColorsConstants.blue)),
                              child: const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1.5,
                                  ))))
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 4,
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
          ],
        ),
      ),
    );
  }
}
