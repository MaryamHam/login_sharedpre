import 'package:flutter/material.dart';
import 'package:login_sharedpre/screens/home_screen.dart';
import 'package:login_sharedpre/screens/login_screen.dart';
import 'package:login_sharedpre/screens/register_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
     // home: HomeScreen(),
    home: LoginScreen(),
    //home: RegisterScreen(),
    );
  }
}