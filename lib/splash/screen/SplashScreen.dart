import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetyapp/auth/PermissionService.dart';
import 'package:safetyapp/golbalui/text/TextMain.dart';
import 'package:safetyapp/utils/color/ColorCode.dart';

import '../../bottomnavbar/BottomNavBar.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    _getPermission();
    super.initState();
  }
  _getPermission()async{
    await PermissionService.requestAllPermissions();
    Future.delayed( const Duration(seconds: 3),() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const BottomNavBar()), (route) => false);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/splash_logo.png',height: 216,width: 240,)),
          Image.asset('assets/app_name.png',height:50,width: 197,),
        ],
      ),
    );
  }
}
