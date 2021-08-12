import 'package:flutter/material.dart';
import 'package:ovcapp/screens/authenticate/client_signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OVC App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClientSignup(title: 'Client Signup',),
    );
  }
}
