import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/widgets/custom_form_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String fullname = "Full Name....";
  String email = "example@gmail.com";

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
      body: Column(
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
              controller: TextEditingController(text: fullname),
              onChanged: (value) => setState(() {
                fullname = value;
              }),
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email",
                    style: TextStyle(
                        color: ColorsConstants.blue,
                        fontWeight: FontsConstants.medium)),
                const SizedBox(
                  height: 10.0,
                ),
         
                CustomFormField(
                  initialValue:email,
                  labelText: "",
                  hintText: "Email",
                  validator: (value) {
                    if (!value!.contains("@")) {
                      return "Invalid email";
                    }
                    return null;
                  },
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsConstants.blue,
        onPressed: () {},
        child:  Icon(
          Icons.check,
          color: ColorsConstants.white,
        ),
      ),
    );
  }
}
