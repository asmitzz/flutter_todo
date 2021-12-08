import 'package:flutter/material.dart';
import 'package:flutter_todo/main.dart';
import 'package:flutter_todo/providers/auth.provider.dart';
import 'package:flutter_todo/providers/profile.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/fonts.dart';
import 'package:flutter_todo/utils/constants/routes.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:flutter_todo/utils/size_config.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String email = "";
  String displayName = "";

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        child: LayoutBuilder(builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: drawerTemplate(),
            ),
          );
        }));
  }

  // Drawer Template
  Container drawerTemplate() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 5,
          vertical: SizeConfig.blockSizeVertical * 5),
      decoration: BoxDecoration(
          color: ColorsConstants.white,
          border: Border.all(color: ColorsConstants.rosyBrown)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              drawerHeader(),
              drawerBody(),
            ],
          ),
          drawerFooter()
        ],
      ),
    );
  }

  // Drawer Header
  Consumer drawerHeader() {
    return Consumer<ProfileProvider>(
      builder:(_,profileProvider,__) => DrawerHeader(
          padding: const EdgeInsets.all(0.0),
          child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: ColorsConstants.white),
              accountName: Text(profileProvider.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: FontsConstants.md_2,
                      color: ColorsConstants.blue)),
              accountEmail: Text(
                profileProvider.email,
                style: TextStyle(
                    fontWeight: FontsConstants.medium,
                    color: ColorsConstants.blue),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: profileProvider.photoUrl != "" ? NetworkImage(profileProvider.photoUrl) : null,
              ))),
    );
  }
}

// Drawer Body
Column drawerBody() {
  return Column(
    children: [
      navigateTo(
          route: RoutesConstants.home,
          routeName: StringsConstants.drawerOption1),
      navigateTo(
          route: RoutesConstants.schedular,
          routeName: StringsConstants.drawerOption2),
      navigateTo(
          route: RoutesConstants.notifications,
          routeName: StringsConstants.drawerOption3),
      navigateTo(
          route: RoutesConstants.profile,
          routeName: StringsConstants.drawerOption4),
      logOut()
    ],
  );
}

// Logout Widget
Consumer<AuthProvider> logOut() {
  logOut(AuthProvider authProvider) async {
    await authProvider.signOut();
  }

  return Consumer<AuthProvider>(
      builder: (_, authProvider, __) => ListTile(
            onTap: () => logOut(authProvider),
            title: Text(
              StringsConstants.drawerOption5,
              style: TextStyle(color: ColorsConstants.blueGrey),
            ),
          ));
}

ListTile navigateTo({required String route, required String routeName}) {
  return ListTile(
    onTap: () => navigatorKey.currentState!.pushReplacementNamed(route),
    title: Text(
      routeName,
      style: TextStyle(color: ColorsConstants.blue),
    ),
  );
}

// Drawer Footer
ListTile drawerFooter() {
  return ListTile(
    title: Text(
      StringsConstants.drawerFooter,
      style: TextStyle(color: ColorsConstants.blueGrey),
    ),
  );
}
