import 'package:fethr/login/cubit/login_cubit.dart';
import 'package:fethr/login/view/login_page.dart';
import 'package:fethr/screens/Welcome_screen/components/background.dart';
import 'package:fethr/screens/Welcome_screen/components/round_button.dart';
import 'package:fethr/signup/view/signup_page.dart';
import 'package:fethr/statics/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginOptionsPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginOptionsPage());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Background(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo-nobg_blk.png',
                    width: size.width * 0.9),
                SizedBox(height: size.height * 0.1),
                _LoginButton(),
                _SignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundButton(
      key: const Key('loginForm_continue_raisedButton'),
      text: LOGIN_ACCOUNT,
      colour: Colors.black,
      textColour: Colors.white,
      onPressed: () => Navigator.of(context).push<void>(LoginPage.route()),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundOutlineButton(
      key: const Key('loginForm_continue_raisedButton'),
      text: SIGNUP,
      colour: Colors.grey[500],
      textColour: Colors.black,
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
    );
  }
}
