import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/providers/auth.provider.dart';
import 'package:flutter_todo/providers/todos.provider.dart';
import 'package:flutter_todo/screens/auth/login/login.dart';
import 'package:flutter_todo/screens/home/home.dart';
import 'package:flutter_todo/widgets/my_routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => const MyApp()) // Wrap your app
      );
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoProvider>(
          create: (_) => TodoProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return snapshot.hasData ? const Home() : const Login();
          },
        ),
        onGenerateRoute: MyRouter.generateRoutes,
      ),
    );
  }
}
