import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'ui/components/components.dart';
import 'ui/pages/pages.dart';

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
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Social Media App',
      theme: AppTheme.lightThemeData,
      //darkTheme: AppTheme.darkThemeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      // initialRoute: '/',
      // routes: const {},
    );
  }
}
