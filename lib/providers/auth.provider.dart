import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo/widgets/toast.dart';
import 'package:flutter_todo/main.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<bool?> signInWithEmailAndPassword(
      {String email = "", String password = ""}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      navigatorKey.currentState!.pushNamed("/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return MyToast().errorToast("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        return MyToast().errorToast("Wrong password provided for that user.");
      }
      return MyToast().errorToast(e.toString());
    }
  }

  Future<bool?> signUpWithEmailAndPassword(
      {String email = "", String password = ""}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return MyToast().successToast("User registered successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return MyToast().errorToast("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        return MyToast()
            .errorToast("The account already exists for that email.");
      }
    } catch (e) {
      return MyToast().errorToast(e.toString());
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
