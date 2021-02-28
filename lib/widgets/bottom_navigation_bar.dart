import 'package:flutter/material.dart';
import 'package:fethr/statics/strings.dart' as str;

class FethrBottomBar extends StatefulWidget {
  @override
  _FethrBottomBarState createState() => _FethrBottomBarState();
}

class _FethrBottomBarState extends State<FethrBottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pushNamed(context, getRoute(index));
    });
  }

  String getRoute(int index) {
    String route = '/'; // Make default initially.
    switch (index) {
      case 0: {
        route = str.ROUTE_SIGNUP;
        break;
      }
      case 1: {
        route = str.ROUTE_HOME;
        break;
      }
      case 2: {
        route = str.ROUTE_HOME;
        break;
      }
      case 3: {
        route = str.ROUTE_HOME;
        break;
      }
      default: {
        route = str.ROUTE_HOME;
      }
    }
    return route;
  }

  int getCurrentIndex() {
    return _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.black,
      selectedIconTheme: IconThemeData(),
      selectedItemColor: Colors.white,
      items: const <BottomNavigationBarItem>[
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
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
