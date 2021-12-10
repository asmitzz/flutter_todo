import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/services/profile_services.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/widgets/toast.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier {
  String name = FirebaseAuth.instance.currentUser!.displayName ?? "";
  String email = FirebaseAuth.instance.currentUser!.email ?? "";
  String photoUrl = StringsConstants.defaultAvatar;

  updateName(String value) {
    name = value;
    notifyListeners();
  }

  updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  updatePhotoUrl(String value) {
    photoUrl = value;
    notifyListeners();
  }

  Future<void> getPhotoUrl() async {
    try {
      String url = await ProfileServices().getProfilePicUrl();
      updatePhotoUrl(url);
    } catch (e) {
      MyToast().errorToast(e.toString());
    }
  }

  Future<void> uploadProfilePic({required XFile pickedFile}) async {
    try {
      String url = await ProfileServices().uploadProfilePic(pickedFile);
      updatePhotoUrl(url);
      MyToast().successToast("Profile pic updated!!");
    } catch (e) {
      MyToast().errorToast(e.toString());
    }
  }

  Future<void> saveProfile() async {
    try {
      await ProfileServices().saveProfile(name: name, email: email);
    } catch (e) {
      MyToast().errorToast(e.toString());
    }
  }

  Future<void> deleteProfilePic() async {
    try {
      await ProfileServices().deleteProfilePic();
      updatePhotoUrl(StringsConstants.defaultAvatar);
      MyToast().successToast("Removed profile pic");
    } catch (e) {
      MyToast().errorToast(e.toString());
    }
  }
}
