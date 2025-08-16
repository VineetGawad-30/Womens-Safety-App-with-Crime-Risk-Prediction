import 'package:flutter/material.dart';
import 'package:safetyapp/bottomnavbar/BottomNavBar.dart';
import 'package:safetyapp/dashboard/screens/DashBoard.dart';
import 'package:safetyapp/splash/screen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen() ,
    );
  }
}


