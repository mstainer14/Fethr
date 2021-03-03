// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class FethrLoginOptionsScreen extends StatefulWidget {
//   @override
//   _FethrLoginOptionsScreenState createState() =>
//       _FethrLoginOptionsScreenState();
// }

// class _FethrLoginOptionsScreenState extends State<FethrLoginOptionsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Center(
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/logo-nobg_blk.png', width: size.width * 0.8),
//             SizedBox(height: 90),
//             SizedBox(
//               width: double.infinity,
//               child: Container(
//                 margin: EdgeInsets.only(left: 15, right: 15),
//                 child: MaterialButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(40.0))),
//                   elevation: 5.0,
//                   height: 60,
//                   color: Colors.black,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         'Login with email',
//                         style: TextStyle(fontSize: 18.0, color: Colors.white),
//                       ),
//                       Icon(
//                         Icons.arrow_forward_ios,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                   onPressed: () => Navigator.of(context).pushNamed('/login'),
//                 ),
//               ),
//             ),
//             SizedBox(height: 40),
//             SizedBox(
//               width: double.infinity,
//               child: Container(
//                 margin: EdgeInsets.only(left: 15, right: 15),
//                 child: MaterialButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(40.0))),
//                   elevation: 5.0,
//                   height: 60,
//                   color: Colors.black,
//                   child: Text(
//                     'Login with Gmail',
//                     style: TextStyle(fontSize: 18.0, color: Colors.white),
//                   ),
//                   onPressed: () async {
//                     // Trigger the authentication flow
//                     final GoogleSignInAccount googleUser =
//                         await GoogleSignIn().signIn();

//                     // Obtain the auth details from the request
//                     final GoogleSignInAuthentication googleAuth =
//                         await googleUser.authentication;

//                     // Create a new credential
//                     final GoogleAuthCredential credential =
//                         GoogleAuthProvider.credential(
//                       accessToken: googleAuth.accessToken,
//                       idToken: googleAuth.idToken,
//                     );
//                     print('CREDENTIAL $credential');

//                     // Once signed in, return the UserCredential
//                     return await FirebaseAuth.instance
//                         .signInWithCredential(credential);
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 80),
//             SizedBox(
//               width: double.infinity,
//               child: Container(
//                 margin: EdgeInsets.only(left: 15, right: 15),
//                 child: MaterialButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(40.0)),
//                       side: BorderSide(
//                           color: Colors.black,
//                           width: 2,
//                           style: BorderStyle.solid)),
//                   elevation: 5.0,
//                   height: 60,
//                   child: Text(
//                     'Sign up',
//                     style: TextStyle(fontSize: 18.0, color: Colors.black),
//                   ),
//                   onPressed: () => Navigator.of(context).pushNamed('/signup'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:fethr/statics/colors.dart';
import 'package:fethr/statics/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Welcome_screen/components/background.dart';
import 'Welcome_screen/components/round_button.dart';

class FethrLoginOptionsScreen extends StatefulWidget {
  @override
  _FethrLoginOptionsScreenState createState() =>
      _FethrLoginOptionsScreenState();
}

class _FethrLoginOptionsScreenState extends State<FethrLoginOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo-nobg_blk.png', width: size.width * 0.9),
            SizedBox(height: size.height * 0.1),
            RoundButton(
              text: LOGIN_ACCOUNT,
              onPressed: () => Navigator.of(context).pushNamed('/login'),
            ),
            RoundOutlineButton(
              text: SIGNUP,
              colour: Colors.grey[500],
              textColour: Colors.black,
              onPressed: () => Navigator.of(context).pushNamed('/signup'),
            ),
          ],
        ),
      ),
    );
  }
}
