import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/providers/profile.provider.dart';
import 'package:flutter_todo/screens/profile/widgets/edit_profile_template.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:flutter_todo/widgets/toast.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _onPressed() async {
          ProfileProvider profileProvider =
              Provider.of<ProfileProvider>(context, listen: false);

          if (formKey.currentState!.validate()) {
            setState(() {
              isLoading = true;
            });
            await profileProvider.saveProfile();
            setState(() {
              isLoading = false;
            });
            navigatorKey.currentState!.pushReplacementNamed("/profile");
            return MyToast().successToast("Profile updated!!");
          }
        }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.safeBlockVertical * 12),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal),
            decoration: BoxDecoration(boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ], color: ColorsConstants.rosyBrown),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  elevation: 0,
                  shadowColor: ColorsConstants.lightRosyBrown,
                  backgroundColor: ColorsConstants.rosyBrown,
                  iconTheme: IconThemeData(color: ColorsConstants.blue),
                  title: Text(StringsConstants.editProfileTitle,
                    style: TextStyle(
                        color: ColorsConstants.blue,
                        fontSize: FontsConstants.base,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      body: SingleChildScrollView(
          child: EditProfileTemplate(
        formKey: formKey,
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
          height: SizeConfig.safeBlockVertical * 14,
              width: SizeConfig.safeBlockHorizontal * 14,
          child: FloatingActionButton(
            backgroundColor: ColorsConstants.blue,
            onPressed: _onPressed,
            child: (isLoading)
                ? SizedBox(
                    height: SizeConfig.safeBlockVertical * 3,
                    width: SizeConfig.safeBlockHorizontal * 3,
                    child: CircularProgressIndicator(
                      color: ColorsConstants.white,
                      strokeWidth: 1.5,
                    ))
                : Icon(
                    Icons.check,
                    color: ColorsConstants.white,
                  ),
          ),
        ),
    );
  }
}
