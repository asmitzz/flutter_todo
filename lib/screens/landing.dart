import 'package:flutter/material.dart';

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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/home");
    });
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
    startApp();
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
        backgroundColor: const Color.fromRGBO(255, 230, 230, 1.0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _animation,
                child: const Text(
                  "🍭",
                  style: TextStyle(
                      fontSize: 60.0, color: Color.fromRGBO(37, 59, 107, 1.0)),
                ),
              ),
              const Text(
                "Candy",
                style: TextStyle(
                    color: Color.fromRGBO(37, 59, 107, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                "Simple task manager",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(37, 59, 107, 1.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
