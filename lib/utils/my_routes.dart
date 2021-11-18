import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/home.dart';
import 'package:flutter_todo/screens/notifications.dart';
import 'package:flutter_todo/screens/profile.dart';
import 'package:flutter_todo/screens/schedular.dart';
import 'package:flutter_todo/widgets/unknown_route.dart';

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

PageRouteBuilder myRoutes({settings}) {
  switch (settings.name) {
    case "/":
       return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Home(),
 transitionsBuilder:(context, animation, secondaryAnimation,child) =>  FadeTransition(opacity: animation,child:child));
      case "/schedular":
       return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Schedular(),
        transitionsBuilder:(context, animation, secondaryAnimation,child) =>  FadeTransition(opacity: animation,child:child));
      case "/notifications":
       return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Notifications(),
        transitionsBuilder: slideTransistion);
      case "/profile":
       return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Profile(),
        transitionsBuilder: slideTransistion);
    default:
     return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const UnknownRoute(),
        transitionsBuilder: slideTransistion);
  }
}
