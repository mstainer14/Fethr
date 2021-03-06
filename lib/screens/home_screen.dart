import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fethr/screens/calendar_screen.dart';
import 'package:fethr/statics/strings.dart' as str;
import 'package:flutter/material.dart';

enum TabItem { home, calendar, event, map }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  dynamic _counter;

  void _incrementCounter() async {
    DocumentSnapshot snapshot = await firestore
        .collection('users')
        .doc('a679QIDYnBhgOHjN1Gs27qJPQJ83')
        .get();
    print('Snapshoto ${snapshot.data()}');
    setState(() {
      // _counter++;
      _counter = snapshot.data().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
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
