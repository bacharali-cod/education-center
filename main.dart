import 'package:flutter/material.dart';
import 'registration_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Page',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: RegistrationPage(),
    );
  }
}