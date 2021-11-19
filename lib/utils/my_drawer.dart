import 'package:flutter/material.dart';

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
        child: Container(
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: const Color.fromRGBO(255, 238, 238, 1.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                children: [
                  const DrawerHeader(
                      padding: EdgeInsets.all(0.0),
                      child: UserAccountsDrawerHeader(
                          decoration: BoxDecoration(color: Colors.white),
                          accountName: Text("Asmit Shrivastava",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(37, 59, 107, 1.0))),
                          accountEmail: Text(
                            "example@gmail.com",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(37, 59, 107, 1.0)),
                          ),
                          currentAccountPicture: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1634926878768-2a5b3c42f139?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGF2YXRhcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
                          ))),
                  Column(
                    children: [
                      ListTile(
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, "/"),
                        title: const Text(
                          "Todo",
                          style: TextStyle(
                              color: Color.fromRGBO(37, 59, 107, 1.0)),
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, "/schedular"),
                        title: const Text(
                          "Schedular",
                          style: TextStyle(
                              color: Color.fromRGBO(37, 59, 107, 1.0)),
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, "/notifications"),
                        title: const Text(
                          "Notifications",
                          style: TextStyle(
                              color: Color.fromRGBO(37, 59, 107, 1.0)),
                        ),
                      ),
                      ListTile(
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, "/profile"),
                        title: const Text(
                          "Profile",
                          style: TextStyle(
                              color: Color.fromRGBO(37, 59, 107, 1.0)),
                        ),
                      ),
                      ListTile(
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, "/"),
                        title: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const ListTile(
                title: Text(
                  "© 2021 candy",
                  style: TextStyle(color: Colors.blueGrey),
                ),
              )
            ],
          ),
        ));
  }
}
