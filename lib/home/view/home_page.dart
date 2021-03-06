// import 'package:fethr/repositories/authentication_repository/authentication_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomePage extends StatelessWidget {
//   static Route route() {
//     return MaterialPageRoute<void>(builder: (_) => HomePage());
//   }

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: <Widget>[
//           IconButton(
//             key: const Key('homePage_logout_iconButton'),
//             icon: const Icon(Icons.exit_to_app),
//             onPressed: () => context
//                 .read<AuthenticationBloc>()
//                 .add(AuthenticationLogoutRequested()),
//           )
//         ],
//       ),
//       body: Align(
//         alignment: const Alignment(0, -1 / 3),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Image.asset('assets/logo.png'),
//             const SizedBox(height: 4.0),
//             Text(user.email, style: textTheme.headline6),
//             const SizedBox(height: 4.0),
//             Text(user.name ?? '', style: textTheme.headline5),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:fethr/questionnaire/view/questionnaire_carousel.dart';
import 'package:fethr/repositories/authentication_repository/authentication_bloc.dart';
import 'package:fethr/screens/calendar_screen.dart';
import 'package:fethr/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fethr/statics/strings.dart' as str;

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: Icon(Icons.home),
      label: str.HOME,
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: Icon(Icons.calendar_today),
      label: str.CALENDAR,
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: Icon(Icons.schedule),
      label: str.EVENTS,
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: Icon(Icons.public),
      label: str.MAP,
    ),
  ];
  List<Widget> _screens = [
    MyHomePage(),
    CalendarScreen(),
    FethrQuestionnaire(),
    CalendarScreen()
  ];
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onPageChanged(int pageNum) {
    setState(() {
      _selectedIndex = pageNum;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        items: _navItems,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
      appBar: AppBar(title: Text(user.email ?? ''), actions: [
        IconButton(
          key: const Key('homePage_logout_iconButton'),
          icon: const Icon(Icons.exit_to_app),
          onPressed: () => context
              .read<AuthenticationBloc>()
              .add(AuthenticationLogoutRequested()),
        ),
      ]),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
