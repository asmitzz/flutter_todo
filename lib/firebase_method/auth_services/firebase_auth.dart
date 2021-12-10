import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential user = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        return Future.error("Wrong password provided for that user.");
      } else {
        return Future.error(e.toString());
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
        return Future.error("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        return Future.error("The account already exists for that email.");
      } else {
        return Future.error(e.toString());
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
