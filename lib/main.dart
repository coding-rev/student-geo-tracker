import 'package:flutter/material.dart';
import 'package:trackapp/screens/homeScreen.dart';
import 'package:trackapp/screens/mapScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Tracking App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      
    );
  }
}
