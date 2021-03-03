import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class FethrSignupScreen extends StatefulWidget {
  FethrSignupScreen({Key key}) : super(key: key);
  @override
  _FethrSignupScreenState createState() => _FethrSignupScreenState();
}

class _FethrSignupScreenState extends State<FethrSignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  final List<Widget> _actionList = [
    Builder(
      builder: (BuildContext context) {
        return FlatButton(
          child: const Text('Sign out'),
          textColor: Theme.of(context).buttonColor,
          onPressed: () async {
            final User user = _auth.currentUser;
            print(user.uid);
            if (user == null) {
//6
              Scaffold.of(context).showSnackBar(const SnackBar(
                content: Text('No one has signed in.'),
              ));
              return;
            }
            // await _auth.signOut();
            // final String uid = user.uid;
            // Scaffold.of(context).showSnackBar(SnackBar(
            //   content: Text(uid + ' has successfully signed out.'),
            // ));
          },
        );
      },
    )
  ];

  @override
  void initState() {
    if (_auth.currentUser != null) {
      // Navigator.of(context).pushNamed('/main');
    }
    super.initState();
  }

  void _register() async {
    final user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
      Navigator.of(context).pushNamed('/main');
    } else {
      setState(() {
        _success = true;
      });
    }
  }

//4
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: _actionList,
      ),
      body: Builder(builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.person),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Full name",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Phone",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Email",
                  ),
                ),
              ),
              const Divider(
                height: 1.0,
              ),
              ListTile(
                leading: const Icon(Icons.label),
                title: const Text('Nick'),
                subtitle: const Text('None'),
              ),
              ListTile(
                leading: const Icon(Icons.today),
                title: const Text('Birthday'),
                subtitle: const Text('February 20, 1980'),
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Contact group'),
                subtitle: const Text('Not specified'),
              )
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

// Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
              // TextFormField(
              //   controller: _emailController,
              //   decoration: const InputDecoration(labelText: 'Email'),
              //   validator: (String value) {
              //     if (value.isEmpty) {
              //       return 'Please enter some text';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: _passwordController,
              //   decoration: const InputDecoration(labelText: 'Password'),
              //   validator: (String value) {
              //     if (value.isEmpty) {
              //       return 'Please enter some text';
              //     }
              //     return null;
              //   },
              // ),
              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 16.0),
              //   alignment: Alignment.center,
              //   child: RaisedButton(
              //     onPressed: () async {
              //       if (_formKey.currentState.validate()) {
              //         _register();
              //       }
              //     },
              //     child: const Text('Submit'),
              //   ),
              // ),
//               Container(
//                 alignment: Alignment.center,
//                 child: Text(_success == null
//                     ? ''
//                     : (_success
//                         ? 'Successfully registered ' + _userEmail
//                         : 'Registration failed')),
//               )
//             ],
//           )
