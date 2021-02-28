import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;

bool userPersisted() {
  bool authState = false;
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      print('User is currently signed out!');
      authState = false;
    } else {
      print('User is signed in!');
      authState = true;
    }
  });
  return authState;
}

// TODO: Do something on error i.e. show the user a prompt.
Future<bool> signup(email, password) async {
  bool success = false;
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    success = true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      success = false;
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      success = false;
    }
  } catch (e) {
    print(e);
    success = false;
  }
  return success;
}

// TODO: Do something on error i.e. show the user a prompt.
Future<bool> signin(email, password) async {
  bool success = true;
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    success = true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      success = false;
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      success = false;
    }
  }
  return success;
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}