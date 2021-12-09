import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/providers/profile.provider.dart';
import 'package:flutter_todo/screens/profile/widgets/edit_profile_header.dart';
import 'package:flutter_todo/services/image_picker_services.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/button_loader.dart';
import 'package:flutter_todo/widgets/buttons.dart';
import 'package:flutter_todo/widgets/custom_form_field.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileTemplate extends StatefulWidget {
  const EditProfileTemplate({
    Key? key,
    required this.formKey,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  _EditProfileTemplateState createState() => _EditProfileTemplateState();
}

class _EditProfileTemplateState extends State<EditProfileTemplate> {
  bool isUploadBtnLoading = false;
  bool isRemoveBtnLoading = false;

  Future<void> uploadProfilePic(XFile pickedFile) async {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    setState(() {
      isUploadBtnLoading = true;
    });

    await profileProvider.uploadProfilePic(pickedFile: pickedFile);
    setState(() {
      isUploadBtnLoading = false;
    });
  }

  Future<void> deleteProfilePic() async {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);

    setState(() {
      isRemoveBtnLoading = true;
    });
    await profileProvider.deleteProfilePic();
    setState(() {
      isRemoveBtnLoading = false;
    });
  }

  @override
  initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      ProfileProvider profileProvider =
          Provider.of<ProfileProvider>(context, listen: false);
      initialName = profileProvider.name;
      initialEmail = profileProvider.email;
    });
    super.initState();
  }

  _onWillPop() async {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);

    navigatorKey.currentState!.pushReplacementNamed("/profile");
    profileProvider.updateEmail(initialEmail);
    profileProvider.updateName(initialName);
    return true;
  }

  String initialName = "";
  String initialEmail = "";

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        return await _onWillPop();
      },
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            editProfileHeader(profileProvider),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 6,
                  vertical: SizeConfig.blockSizeVertical * 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profilePicUpdateSection(profileProvider),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 4,
                  ),
                  CustomFormField(
                    borderSide: BorderSide(color: ColorsConstants.blue),
                    initialValue: profileProvider.email,
                    onChanged: (value) {
                      profileProvider.updateEmail(value);
                    },
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

  Row profilePicUpdateSection(ProfileProvider profileProvider) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: ColorsConstants.blue,
          backgroundImage: profileProvider.photoUrl != ""
              ? NetworkImage(profileProvider.photoUrl)
              : null,
          radius: SizeConfig.blockSizeHorizontal * 10,
        ),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal * 4,
        ),
        profileProvider.photoUrl != StringsConstants.defaultAvatar
            ? (isRemoveBtnLoading == false
                ? customButton(
                    onPressed: deleteProfilePic,
                    icon:Icons.delete,
                    text:"REMOVE",
                    background: ColorsConstants.error
                ) 
                : ButtonLoader(background: ColorsConstants.error))
            : Container(),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal * 2,
        ),
        (isUploadBtnLoading == false
            ? customButton(
                    onPressed: () =>
                    ImagePickerServices().getFromGallery(uploadProfilePic),
                    icon:Icons.edit,
                    text:"UPLOAD",
                    background: ColorsConstants.blue
                )  
            : ButtonLoader(background: ColorsConstants.blue))
      ],
    );
  }
}
