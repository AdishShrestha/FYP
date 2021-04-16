import 'package:flutter/material.dart';
import 'package:rent_room/views/home.dart';
import 'package:rent_room/views/login_page.dart';
import 'package:rent_room/views/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V-Room Rent Room',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: Home(),
      home: LoginPage(),
      //home: RegisterPage(),
    );
  }
}
