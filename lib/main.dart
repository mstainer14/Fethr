import 'package:fethr/screens/home_screen.dart';
import 'package:fethr/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'statics/strings.dart' as str;
import 'statics/colors.dart' as col;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // '/': (context) => MyHomePage(),
        '/signup': (context) => SignUpScreen(),
      },
      title: str.APP_NAME,
      theme: ThemeData(
        primarySwatch: col.primaryBlack,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: str.APP_NAME),
    );
  }
}