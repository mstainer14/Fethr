import 'package:fethr/screens/calendar_screen.dart';
import 'package:fethr/screens/home_screen.dart';
import 'package:fethr/statics/strings.dart' as str;
import 'package:flutter/material.dart';

class FetherMainContainer extends StatefulWidget {
  FetherMainContainer({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FetherMainContainerState createState() => _FetherMainContainerState();
}

class _FetherMainContainerState extends State<FetherMainContainer> {
  List<Widget> _actionList = [
    Image.asset(
      'assets/ic_launcher_nobg.png',
      height: 40,
      width: 40,
    ),
  ];
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
  List<Widget> _screens = [MyHomePage(), CalendarScreen(), CalendarScreen(), CalendarScreen()];
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        items: _navItems,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
      appBar: AppBar(title: Text(widget.title), actions: _actionList),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

// Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'You have pushed the button this many times:',
//           ),
//           Text(
//             '$_counter',
//             style: Theme.of(context).textTheme.headline4,
//           ),
//         ],
//       ),
//     );
