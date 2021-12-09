import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/providers/profile.provider.dart';
import 'package:flutter_todo/services/image_picker_services.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
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
          children: [
            Container(
                height: SizeConfig.safeBlockVertical * 25,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 6,
                    vertical: SizeConfig.blockSizeVertical * 6),
                color: ColorsConstants.lightRosyBrown,
                child: CustomFormField(
                  fontSize: FontsConstants.xl,
                  fontWeight: FontsConstants.bold,
                  borderSide: BorderSide.none,
                  enableBorderSide: BorderSide.none,
                  focusedBorderSide: BorderSide.none,
                  initialValue: profileProvider.name,
                  onChanged: (value) {
                    profileProvider.updateName(value);
                  },
                  labelText: "",
                  hintText: "Enter you name",
                  validator: (String value) {
                    if (value.length < 3) {
                      return "Invalid name";
                    }
                    return null;
                  },
                )),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                      profileProvider.photoUrl !=
                              StringsConstants.profile["default_pic"]
                          ? (isRemoveBtnLoading == false
                              ? ElevatedButton.icon(
                                  onPressed: deleteProfilePic,
                                  icon: Icon(
                                    Icons.delete,
                                    size: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  label: Text("REMOVE",
                                      style: TextStyle(
                                          fontSize: FontsConstants.sm)),
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical * 2,
                                          horizontal:
                                              SizeConfig.blockSizeVertical *
                                                  2)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorsConstants.error),
                                  ))
                              : ElevatedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical * 2,
                                          horizontal:
                                              SizeConfig.blockSizeVertical *
                                                  2)),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ColorsConstants.error)),
                                  child: const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 1.5,
                                      ))))
                          : Container(),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 2,
                      ),
                      (isUploadBtnLoading == false
                          ? ElevatedButton.icon(
                              onPressed: () => ImagePickerServices()
                                  .getFromGallery(uploadProfilePic),
                              icon: Icon(
                                Icons.edit,
                                size: SizeConfig.blockSizeHorizontal * 3,
                              ),
                              label: Text("UPLOAD",
                                  style:
                                      TextStyle(fontSize: FontsConstants.sm)),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical * 2,
                                          horizontal:
                                              SizeConfig.blockSizeVertical *
                                                  2)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorsConstants.blue),
                              ))
                          : ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.blockSizeVertical * 2,
                                          horizontal:
                                              SizeConfig.blockSizeVertical *
                                                  2)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          ColorsConstants.blue)),
                              child: SizedBox(
                                  width: SizeConfig.blockSizeVertical * 3,
                                  height: SizeConfig.blockSizeVertical * 3,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1.5,
                                  ))))
                    ],
                  ),
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
}
