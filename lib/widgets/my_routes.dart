import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/profile/edit_profile.dart';
import 'package:flutter_todo/screens/home/home.dart';
import 'package:flutter_todo/screens/landing/landing.dart';
import 'package:flutter_todo/screens/auth/login/login.dart';
import 'package:flutter_todo/screens/task/new_task.dart';
import 'package:flutter_todo/screens/notifications/notifications.dart';
import 'package:flutter_todo/screens/profile/profile.dart';
import 'package:flutter_todo/screens/auth/register/register.dart';
import 'package:flutter_todo/screens/schedular/schedular.dart';
import 'package:flutter_todo/screens/unknown_route/unknown_route.dart';

class MyRouter {
  static Route<dynamic> generateRoutes(settings) {
    switch (settings.name) {
      case "/":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Landing(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child));
      case "/home":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Home(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child));
      case "/schedular":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Schedular(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child));
      case "/notifications":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Notifications(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child));
      case "/profile":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Profile(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child));
      case "/editprofile":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const EditProfile(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child));
      case "/new-task":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const NewTask(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child));
      case "/login":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Login(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child));
      case "/register":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Register(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child));
      default:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const UnknownRoute(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child));
    }
  }

  Widget slideTransistion(context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    final tween = Tween(begin: begin, end: end);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }
}
