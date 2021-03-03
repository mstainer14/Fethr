import 'package:fethr/screens/calendar_screen.dart';
import 'package:fethr/screens/login_options_screen.dart';
import 'package:fethr/screens/login_screen.dart';
import 'package:fethr/screens/registration_screen.dart';
import 'package:fethr/screens/main_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'statics/strings.dart' as str;
import 'statics/colors.dart' as col;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              initialRoute: '/',
              routes: {
                // '/': (context) => MyHomePage(),
                '/signup': (context) => FethrSignupScreen(),
                '/login': (context) => FethrLoginScreen(),
                '/main': (context) => FetherMainContainer(title: str.APP_NAME),
              },
              title: str.APP_NAME,
              theme: ThemeData(
                primarySwatch: col.primaryBlack,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              // home: FetherMainContainer(title: str.APP_NAME),
              // home: FethrLoginSignupScreen(title: 'Login'),
              home: FethrLoginOptionsScreen(),
            );
          }

          return CircularProgressIndicator();
        });
  }
}
