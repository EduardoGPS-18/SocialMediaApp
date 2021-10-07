import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main/factory/factory.dart';
import 'ui/components/components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Social Media App',
      theme: AppTheme.lightThemeData,
      //darkTheme: AppTheme.darkThemeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 400),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => makeAuthPage(),
        '/central-app-page': (context) => makeCentralAppPage(),
      },
    );
  }
}
