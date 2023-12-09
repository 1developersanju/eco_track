import 'package:electricity/dummy/tests.dart';
import 'package:electricity/widgets/flip.dart';
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
          useMaterial3: true,
          primarySwatch: Colors.teal,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: 
        // YourWidget(),
 BottomBar()

//  LoginScreen(),
        );
  }
}
