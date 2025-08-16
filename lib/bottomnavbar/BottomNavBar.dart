import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safetyapp/contacts/screens/Contacts.dart';
import 'package:safetyapp/dashboard/data/vm/VmDashBoard.dart';
import 'package:safetyapp/dashboard/screens/DashBoard.dart';
import 'package:safetyapp/golbalui/text/TextMain.dart';
import 'package:safetyapp/lawandtutorial/screens/Tutorial.dart';
import 'package:safetyapp/settings/data/VmSettings.dart';
import 'package:safetyapp/settings/screens/Setting.dart';
import 'package:safetyapp/utils/color/ColorCode.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  String tabName ='Home';



 Map<Widget,IconData> bottom = {
   const DashBoard():Icons.dashboard_rounded,
   const Contacts(): Icons.quick_contacts_dialer_outlined,
   const Tutorial():Icons.list_alt,
   const Setting():Icons.settings_outlined
 };

 void _getName(int index){
   switch(index){
     case 0:
       tabName = 'Home';
       break;
     case 1:
       tabName = 'Contacts';
       break;
     case 2:
       tabName = 'Law';
       break;
     case 3:
       tabName = 'settings';
       break;
   }
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:bottom.keys.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom+16,top: 10),
        width: double.infinity,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorCode.boxShadow,
                offset: Offset(0, 4),
                blurRadius: 10,
                spreadRadius: 5
              )
            ],
          color: ColorCode.secondary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bottomIcon(0),
            bottomIcon(1),
            bottomIcon(2),
            bottomIcon(3),
          ],
        ),
      )
    );
  }

  Widget bottomIcon(int index){
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.white,
      onTap: (){
        HapticFeedback.mediumImpact();
        setState(() {
          _currentIndex = index;
          _getName(index);
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(bottom.values.elementAt(index),color: Colors.white),
         _currentIndex==index? const SizedBox(width:2,):const Offstage(),
          _currentIndex==index?TextMain(label: tabName, fontSize: 10,color: Colors.white,fontWeight: FontWeight.w600,):const Offstage(),
        ],
      )
    );
  }


}
