import 'package:flutter/material.dart';

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
        shadowColor: const Color.fromRGBO(254, 224, 224, 1.0),
        backgroundColor: const Color.fromRGBO(255, 230, 230, 1.0),
        iconTheme: const IconThemeData(color: Color.fromRGBO(37, 59, 107, 1.0)),
        title: const Text(
          "EDIT PROFILE",
          style: TextStyle(
              color: Color.fromRGBO(37, 59, 107, 1.0),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 40.0),
            color: const Color.fromRGBO(255, 238, 238, 1.0),
            child: EditableText(
              focusNode: FocusNode(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                  color: Color.fromRGBO(37, 59, 107, 1.0)),
              cursorColor: const Color.fromRGBO(37, 59, 107, 1.0),
              backgroundCursorColor: Colors.black,
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
                const Text("Email",
                    style: TextStyle(
                        color: Color.fromRGBO(
                          37,
                          59,
                          107,
                          1.0,
                        ),
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {},
                  initialValue: email,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
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
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor:const Color.fromRGBO(
            37,
            59,
            107,
            1.0,
          ),
        onPressed: () {},
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
