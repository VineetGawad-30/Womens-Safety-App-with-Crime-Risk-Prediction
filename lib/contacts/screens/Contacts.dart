import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safetyapp/auth/GrowingTextField.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GrowingTextField(
            controller: textController,
            hintText: "0.00",
            textStyle: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}

