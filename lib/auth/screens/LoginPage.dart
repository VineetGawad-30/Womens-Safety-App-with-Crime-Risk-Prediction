import 'package:flutter/material.dart';
import 'package:safetyapp/golbalui/text/TextMain.dart';
import 'package:safetyapp/utils/color/ColorCode.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextMain(label: 'Welcome !', fontSize: 30,fontWeight: FontWeight.w500,color: ColorCode.main,),
            const SizedBox(height: 25,),
            TextMain(label: 'Sign In', fontSize: 20,fontWeight: FontWeight.w500,color: ColorCode.textContent,),

          ],
        ),
      ),
    );
  }
}
