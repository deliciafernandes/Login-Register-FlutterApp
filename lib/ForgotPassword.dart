import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Done.dart';

// ignore: must_be_immutable
class ForgotPassword extends StatelessWidget {
  static String id = '/ForgotPassword';

  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  // ignore: missing_return
  Future<String> getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        email = user.email;

        return email;
      }
    } catch (e) {
      print(e);

      return null;
    }
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
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
                  'Reset Password',
                  style: TextStyle(fontSize: 50.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter your email',
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
                  ],
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  color: Color(0xff447def),
                  onPressed: () {
                    resetPassword(email);
                    Navigator.pushNamed(context, Done.id);
                  },
                  child: Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
                Text(
                  'Check your email to reset password!',
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
