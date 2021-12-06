import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.ease);

  void startApp() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      navigatorKey.currentState!.pushReplacementNamed("/login");
    } else {
      navigatorKey.currentState!.pushReplacementNamed("/home");
    }
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      startApp();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstants.rosyBrown,
        body: LayoutBuilder(builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: _animation,
                      child: Text(
                        StringsConstants.landing["icon"],
                        style: TextStyle(
                            fontSize: FontsConstants.xl_3,
                            color: ColorsConstants.blue),
                      ),
                    ),
                    Text(
                      StringsConstants.landing["heading"],
                      style: TextStyle(
                          color: ColorsConstants.blue,
                          fontWeight: FontsConstants.bold,
                          fontSize: FontsConstants.xl_1),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      StringsConstants.landing["text"],
                      style: TextStyle(
                          fontWeight: FontsConstants.medium,
                          color: ColorsConstants.blue),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
