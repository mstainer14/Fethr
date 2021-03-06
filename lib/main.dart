import 'package:equatable/equatable.dart';
import 'package:fethr/questionnaire/view/questionnaire_carousel.dart';
import 'package:fethr/repositories/authentication_repository/authentication_bloc.dart';
import 'package:fethr/repositories/authentication_repository/authentication_repository.dart';
import 'package:fethr/screens/splash_screen.dart';
import 'package:fethr/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home/view/home_page.dart';
import 'login_options/view/login_options_page.dart';
import 'statics/colors.dart' as col;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(authenticationRepository: AuthenticationRepository()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
    @required this.authenticationRepository,
  })  : assert(authenticationRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: col.primaryBlack,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                print('CUrrenly Logged ${state.surveyComplete}');
                if (!state.surveyComplete) {
                  _navigator.pushAndRemoveUntil<void>(
                    FethrQuestionnaire.route(),
                    (route) => false,
                  );
                  
                } else {
                  _navigator.pushAndRemoveUntil<void>(
                    HomePage.route(),
                    (route) => false,
                  );
                }
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  // LoginPage.route(),
                  LoginOptionsPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   final AuthenticationRepository authenticationRepository;

//   MyApp({
//     Key key,
//     @required this.authenticationRepository,
//   })  : assert(authenticationRepository != null),
//         super(key: key);

//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: _initialization,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             print(snapshot.error);
//           }

//           if (snapshot.connectionState == ConnectionState.done) {
//             return MaterialApp(
//               initialRoute: '/',
//               routes: {
//                 // '/': (context) => MyHomePage(),
//                 '/signup': (context) => FethrSignupScreen(),
//                 '/login': (context) => FethrLoginScreen(),
//                 '/main': (context) => FetherMainContainer(title: str.APP_NAME),
//               },
//               title: str.APP_NAME,
//               theme: ThemeData(
//                 primarySwatch: col.primaryBlack,
//                 visualDensity: VisualDensity.adaptivePlatformDensity,
//               ),
//               // home: FetherMainContainer(title: str.APP_NAME),
//               // home: FethrLoginSignupScreen(title: 'Login'),
//               home: FethrLoginOptionsScreen(),
//             );
//           }

//           return CircularProgressIndicator();
//         });
//   }
// }
