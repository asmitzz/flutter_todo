import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo/services/firebase_services.dart';
import 'package:flutter_todo/widgets/toast.dart';

class AuthProvider with ChangeNotifier {
  User? getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<bool?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await FirebaseServices()
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      MyToast().errorToast(e.toString());
    }
  }

  Future<bool?> signUpWithEmailAndPassword(
      {String email = "", String password = ""}) async {
    try {
      await FirebaseServices()
          .signUpWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      MyToast().errorToast(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseServices().signOut();
    } catch (e) {
      MyToast().errorToast(e.toString());
    }
  }
}
