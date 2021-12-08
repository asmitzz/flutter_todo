import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      navigatorKey.currentState!.pushReplacementNamed("/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ErrorDescription("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        throw ErrorDescription("Wrong password provided for that user.");
      }
      else{
        throw ErrorDescription(e.toString());
      }
    }
  }

  Future<bool?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ErrorDescription("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        throw ErrorDescription("The account already exists for that email.");
      }
      else{
        throw ErrorDescription(e.toString());
      }
    } 
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      navigatorKey.currentState!.pushReplacementNamed("/login");
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
