import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/providers/profile.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:provider/provider.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.ease);


  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                        StringsConstants.logo,
                        style: TextStyle(
                            fontSize: FontsConstants.xxl,
                            color: ColorsConstants.blue),
                      ),
                    ),
                    Text(
                      StringsConstants.landingPageHeading,
                      style: TextStyle(
                          color: ColorsConstants.blue,
                          fontWeight: FontsConstants.bold,
                          fontSize: FontsConstants.xl_1),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 6,
                    ),
                    Text(
                      StringsConstants.landingPageTitle,
                      style: TextStyle(
                          fontSize: FontsConstants.md_1,
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
