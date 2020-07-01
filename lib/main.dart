import 'package:flutter/material.dart';
import 'package:task/results_screen/ForgotPassword.dart';
import 'package:task/main_screens/LoginPage.dart';
import 'package:task/main_screens/RegisterPage.dart';
import 'results_screen/Done.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Abel'),
      initialRoute: RegisterPage.id,
      routes: {
        RegisterPage.id: (context) => RegisterPage(),
        LoginPage.id: (context) => LoginPage(),
        ForgotPassword.id: (context) => ForgotPassword(),
        Done.id: (context) => Done(),
      },
    );
  }
}
