import 'package:flutter/material.dart';
import 'package:safetyapp/auth/screens/LoginPage.dart';
import 'package:safetyapp/golbalui/text/TextMain.dart';
import 'package:safetyapp/settings/data/VmSettings.dart';
import 'package:safetyapp/utils/color/ColorCode.dart';

class Setting extends StatefulWidget {
  const Setting({super.key,});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        forceMaterialTransparency: true,
        flexibleSpace: _appBar(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
        _shakeDetection(),
          _section(label: 'Profile',onTap: (){}),
          _section(label: 'About Us',onTap: (){}),
          _section(label: 'Log out',onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
          }),
        ],
      )
    );
  }

  Widget _shakeDetection(){
    return InkWell(
      splashColor: Colors.transparent,
     highlightColor: Colors.transparent,
     onTap: (){
      VmSettings.isShakeDetection.value=!VmSettings.isShakeDetection.value;
      VmSettings.toggleShakeDetection(VmSettings.isShakeDetection.value);
    },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 14),
        decoration:const  BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorCode.boxShadow2,width: 0.5
            )
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const  TextMain(label: 'Shake Detection ', fontSize: 16,fontWeight: FontWeight.normal,),
            const Spacer(),
            ValueListenableBuilder(valueListenable: VmSettings.isShakeDetection, builder: (_,isOn,__){
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,),
                decoration: BoxDecoration(
                  color: isOn?ColorCode.sucess:Colors.transparent,
                    border:isOn? null :Border.all(color: ColorCode.sosButton,width: 0.5),
                    borderRadius: BorderRadius.circular(4)
                ),
                child:TextMain(label:isOn?'On':'off' ,fontSize:14,color: isOn?Colors.white:ColorCode.sosButton,fontWeight: FontWeight.w600,),
              );
            })
          ],
        ),
      ),
    );
  }
  Widget _appBar(){
    return Container(
      padding: EdgeInsets.only(top:MediaQuery.of(context).viewPadding.top+12),
      decoration:const  BoxDecoration(
          color: ColorCode.secondary,
          boxShadow: [
            BoxShadow(
                color: ColorCode.boxShadow,
                offset: Offset(0,4),
                blurRadius: 10
            ),
          ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/app_bar_logo.png',height:45 ,width: 123,),
        ],
      ),
    );
  }

  Widget _section({required String label, void Function()? onTap }){
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 14),
        decoration:const  BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: ColorCode.boxShadow2,width: 0.5
                )
            )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextMain(label: label, fontSize: 16,fontWeight: FontWeight.normal,),
         Icon(Icons.arrow_forward_ios_outlined,size: 14,color:ColorCode.secondary.withOpacity(0.8) ,)
          ],
        ),
      ),
    );
  }
}
