import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/profile/widgets/profile_content.dart';
import 'package:flutter_todo/screens/profile/widgets/profile_header.dart';

class ProfileTemplate extends StatefulWidget {
  const ProfileTemplate({Key? key}) : super(key: key);

  @override
  _ProfileTemplateState createState() => _ProfileTemplateState();
}

class _ProfileTemplateState extends State<ProfileTemplate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
         ProfileHeader(),
         ProfileContent()
      ],
    );
  }
}
