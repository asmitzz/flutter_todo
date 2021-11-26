import 'package:flutter/material.dart';
import 'package:flutter_todo/helpers/http_service.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool isAuth = false;
  String baseUri = "https://insta-clone-10062000.herokuapp.com";

  signUpWithEmailAndPassword(
      {TextEditingController? emailController,
      TextEditingController? passwordController,
      TextEditingController? nameController,
      TextEditingController? usernameController,
      BuildContext? context
      }) async {

    Map<String, dynamic> res = await HttpService()
        .httpRequests(Uri.parse("$baseUri/signup"), "POST", body: {
      "email": emailController?.text,
      "username": usernameController?.text,
      "fullname": nameController?.text,
      "password": passwordController?.text,
    });

    if (res["statusCode"] >= 400) {
      mySnackBar(
            context: context,
            content: res["message"],
            backgroundColor: ColorsConstants.error
      );
    } else if (res["statusCode"] >= 200 && res["statusCode"] < 300) {
      emailController?.clear();
      passwordController?.clear();
      nameController?.clear();
      usernameController?.clear();
      mySnackBar(
            context: context,
            content: "Account created succesfully!!",
            backgroundColor: ColorsConstants.green
      );
    } else {
      mySnackBar(
            context: context,
            content: "Please check your internet connection.",
            backgroundColor: ColorsConstants.error
      );
    }
    notifyListeners();
  }

  signInWithEmailAndPassword(
      {TextEditingController? emailController,
      TextEditingController? passwordController,
      BuildContext? context}) async {

    Map<String, dynamic> res = await HttpService()
        .httpRequests(Uri.parse("$baseUri/signin"), "POST", body: {
      "emailOrUsername": emailController?.text,
      "password": passwordController?.text,
    });

    if (res["statusCode"] >= 400) {
      mySnackBar(
            context: context,
            content: res["message"],
            backgroundColor: ColorsConstants.error
      );
    } else if (res["statusCode"] >= 200 && res["statusCode"] < 300) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", res["data"]["token"]);
      prefs.setString("uid", res["data"]["user"]["_id"]);
      emailController?.clear();
      passwordController?.clear();
      if (context != null) {
        Navigator.pushReplacementNamed(context, "/home");
      }
    } else {
      if (context != null) {
        mySnackBar(
            context: context,
            content: "Please check your internet connection.",
            backgroundColor: ColorsConstants.error
        );
       }
    }
    notifyListeners();
  }

  signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.remove("uid");
    Navigator.pushReplacementNamed(context, "/login");
  }
}
