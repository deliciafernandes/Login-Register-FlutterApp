import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Done extends StatefulWidget {
  static String id = '/Done';

  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Done!',
          style: TextStyle(fontSize: 25.0, color: Colors.blue),
        ),
      ),
    );
  }
}
