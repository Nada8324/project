import 'package:flutter/material.dart';
import 'package:project/home_screen.dart';
import 'package:project/layout/home_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner:false,
      home:Layout_screen()
    );
  }
}