import 'package:electricity/view/BottomBar/BottomBar.dart';
import 'package:electricity/view/login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eco Track',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: BottomBar()

        //  LoginScreen(),
        );
  }
}
