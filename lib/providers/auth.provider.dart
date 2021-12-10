import 'package:flutter/material.dart';
import 'package:flutter_todo/firebase_method/auth_services/firebase_auth.dart';
import 'package:flutter_todo/widgets/toast.dart';

class AuthProvider with ChangeNotifier {
  

  Future<bool?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await AuthService()
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      MyToast().errorToast(e.toString());
    }
  }

  Future<bool?> signUpWithEmailAndPassword(
      {String email = "", String password = ""}) async {
    try {
      await AuthService()
          .signUpWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      MyToast().errorToast(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await AuthService().signOut();
    } catch (e) {
      MyToast().errorToast(e.toString());
    }
  }
}
