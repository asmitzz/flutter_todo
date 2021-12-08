import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileServices {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> getProfilePicUrl() async {
    try {
      firebase_storage.Reference reference =
          storage.ref().child("profile/" + uid);
      String imageUrl = await reference.getDownloadURL();
      return imageUrl;
    } catch (e) {
      throw ErrorDescription("No profile pic found");
    }
  }

  Future<String> uploadProfilePic(XFile pickedFile) async {
    String imageUrl = "";
    try {
      firebase_storage.Reference reference =
          storage.ref().child("profile/" + uid);

      firebase_storage.TaskSnapshot uploadTask =
          await reference.putFile(File(pickedFile.path));

      imageUrl = await uploadTask.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<String?> deleteProfilePic() async {
    try {
      firebase_storage.Reference reference =
          storage.ref().child("profile/" + uid);
      await reference.delete();
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<String?> saveProfile(
      {required String name, required String email}) async {
    try {
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
