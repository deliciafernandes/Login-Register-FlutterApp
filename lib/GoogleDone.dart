import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class GoogleDone extends StatefulWidget {
  GoogleSignIn _googleSignIn;
  FirebaseUser _user;

  GoogleDone(FirebaseUser user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  _GoogleDone createState() => _GoogleDone();
}

class _GoogleDone extends State<GoogleDone> {
  Widget check() {
    print('Happening');

    if (widget._user.email != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
              child: Image.network(widget._user.photoUrl,
                  width: 100, height: 100, fit: BoxFit.cover)),
          Text(
            widget._user.displayName,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              widget._googleSignIn.signOut();
              Navigator.pop(context);
            },
            child: Text('Google Sign in done!'),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: check()),
    );
  }
}
