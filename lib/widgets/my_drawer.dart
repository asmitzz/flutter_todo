import 'package:flutter/material.dart';
import 'package:flutter_todo/providers/auth.provider.dart';
import 'package:flutter_todo/utils/constants/colors.dart';
import 'package:flutter_todo/utils/constants/strings.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: ColorsConstants.rosyBrown)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    DrawerHeader(
                        padding: const EdgeInsets.all(0.0),
                        child: UserAccountsDrawerHeader(
                            decoration:
                                BoxDecoration(color: ColorsConstants.white),
                            accountName: Text("Asmit Shrivastava",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: ColorsConstants.blue)),
                            accountEmail: Text(
                              "example@gmail.com",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: ColorsConstants.blue),
                            ),
                            currentAccountPicture: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  StringsConstants.drawer["default_avatar"]),
                            ))),
                    Column(
                      children: [
                        ListTile(
                          onTap: () =>
                              Navigator.pushReplacementNamed(context, "/"),
                          title: Text(
                            StringsConstants.drawerOptions["option_1"],
                            style: TextStyle(color: ColorsConstants.blue),
                          ),
                        ),
                        ListTile(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, "/schedular"),
                          title: Text(
                            StringsConstants.drawerOptions["option_2"],
                            style: TextStyle(color: ColorsConstants.blue),
                          ),
                        ),
                        ListTile(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, "/notifications"),
                          title: Text(
                            StringsConstants.drawerOptions["option_3"],
                            style: TextStyle(color: ColorsConstants.blue),
                          ),
                        ),
                        ListTile(
                          onTap: () =>
                              Navigator.pushReplacementNamed(context, "/profile"),
                          title: Text(
                            StringsConstants.drawerOptions["option_4"],
                            style: TextStyle(color: ColorsConstants.blue),
                          ),
                        ),
                        Consumer<AuthProvider>(
                          builder:(_,authProvider,__) => ListTile(
                          onTap: () => authProvider.signOut(context),
                          title:  Text(
                            StringsConstants.drawerOptions["option_5"],
                            style: TextStyle(color: ColorsConstants.blueGrey),
                          ),
                        ))
                      ],
                    ),
                  ],
                ),
                 ListTile(
                  title: Text(
                    "?? 2021 candy",
                    style: TextStyle(color: ColorsConstants.blueGrey),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
