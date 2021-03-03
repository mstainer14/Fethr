import 'package:fethr/screens/Welcome_screen/components/background.dart';
import 'package:fethr/screens/Welcome_screen/components/round_button.dart';
import 'package:fethr/statics/strings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class FethrLoginScreen extends StatefulWidget {
  FethrLoginScreen({Key key}) : super(key: key);
  @override
  _FethrLoginScreenState createState() => _FethrLoginScreenState();
}

class _FethrLoginScreenState extends State<FethrLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  @override
  void initState() {
    if (_auth.currentUser != null) {
      // Navigator.of(context).pushNamed('/main');
    }
    super.initState();
  }

  void _login() async {
    final user = (await _auth.signInWithEmailAndPassword(
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo-nobg_blk.png',
                    width: size.width * 0.9),
                SizedBox(height: size.height * 0.1),
                Container(
                  width: size.width * 0.9,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: size.width * 0.9,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30),
                RoundButton(
                  text: 'Login',
                  colour: Colors.black,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _login();
                    }
                  },
                  textColour: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
