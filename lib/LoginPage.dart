import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/ForgotPassword.dart';
import 'package:task/GoogleDone.dart';
import 'package:task/RegisterPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Done.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  static String id = '/LoginPage';

  String email;
  String password;

  final _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> _handleSignIn() async {
    // hold the instance of the authenticated user
    FirebaseUser user;
    // flag to check whether we're signed in already
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      // if so, return the current user
      user = await _auth.currentUser();
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      user = (await _auth.signInWithCredential(credential)).user;
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    FirebaseUser user = await _handleSignIn();

    print('Im here');

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GoogleDone(user, _googleSignIn)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/images/background.png'),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 50.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back,',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Text(
                      'please login',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Text(
                      'to your account',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ForgotPassword.id);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 20.0, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  color: Color(0xff447def),
                  onPressed: () async {
                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, Done.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        width: 60.0,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Or',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        width: 60.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        color: Colors.white,
                        shape: ContinuousRectangleBorder(
                          side: BorderSide(width: 0.5, color: Colors.grey[400]),
                        ),
                        onPressed: () {
                          onGoogleSignIn(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/google.png',
                                fit: BoxFit.contain, width: 40.0, height: 40.0),
                            Text(
                              'Google',
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        color: Colors.white,
                        shape: ContinuousRectangleBorder(
                          side: BorderSide(width: 0.5, color: Colors.grey[400]),
                        ),
                        onPressed: () {
                          //TODO: Implement facebook functionality
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/facebook.png',
                                fit: BoxFit.cover, width: 40.0, height: 40.0),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: Text(
                        ' Sign Up',
                        style: TextStyle(fontSize: 25.0, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
