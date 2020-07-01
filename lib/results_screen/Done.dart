import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseUser loggedInUser;

// ignore: must_be_immutable
class Done extends StatefulWidget {
  static String id = '/Done';

  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      //TODO 10 : New user variable to check if a newUser is signed in
      final user = await _auth.currentUser();
      //Equal to null if no user is signed in, else equal to new user details
      //TODO 11 : Use if else block to get the loggedInUser details
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/done.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: [0.5, 1],
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.2)
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Welcome User!',
              style: TextStyle(fontSize: 50.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
