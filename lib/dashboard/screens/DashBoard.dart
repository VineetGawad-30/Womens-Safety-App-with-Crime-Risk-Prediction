import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:safetyapp/dashboard/data/vm/VmDashBoard.dart';
import 'package:safetyapp/dashboard/screens/SosButton.dart';
import 'package:safetyapp/golbalui/text/TextMain.dart';
import 'package:safetyapp/utils/color/ColorCode.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'QuickAction.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  VmDashBoard vmDashBoard = VmDashBoard();
  double top = 0.0;
  @override
  Widget build(BuildContext context) {
     top = MediaQuery.of(context).viewPadding.top+10;
    return Scaffold(
      appBar: AppBar(

        flexibleSpace: _appBar(),
      ),
      body: _body(),
    );
  }
  Widget _appBar(){
    return Container(
      padding: EdgeInsets.only(top:top),
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

  Widget _body(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            _lawContainer(),
            const SizedBox(height: 35,),
            const TextMain(label: 'Help Line', fontSize: 14,fontWeight: FontWeight.bold,),
            const SizedBox(height: 10,),
            _helpLineList(),
            const SizedBox(height: 35,),
            const TextMain(label: 'Near me', fontSize: 14,fontWeight: FontWeight.bold,),
            const SizedBox(height: 10,),
            nearMe(),
            const SizedBox(height: 35,),
            const TextMain(label: 'Emergency SOS', fontSize: 14,fontWeight: FontWeight.bold,),
            const SizedBox(height: 15,),
            SosButton(vmDashBoard: vmDashBoard,),
            const SizedBox(height: 35,),
            const TextMain(label: 'Quick actions', fontSize: 14,fontWeight: FontWeight.bold,),
            const SizedBox(height: 10,),
            QuickAction(vmDashBoard: vmDashBoard,),
          ],
        ),
      ),
    );
  }

  Widget _lawContainer(){
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: (){},
      child: Container(
        padding:const  EdgeInsets.symmetric(horizontal: 10,vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow:const [
            BoxShadow(
              color: ColorCode.boxShadow,
              offset: Offset(0, 0),
              blurRadius: 1,
            )
          ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextMain(fontSize: 10, label: 'Laws & Tutorials for women’s',color: ColorCode.textSecondary,),
            const Spacer(),
            Image.asset('assets/law_book.png',height: 24,width: 24,),
           const SizedBox(width: 7,),
            Image.asset('assets/orange_arrow.png',height: 8,width: 5,),
          ],
        ),
      ),
    );
  }

  Widget _helpLineList(){
    return SizedBox(
      height: 78,
      child: ListView.separated(
        padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (){
                FlutterPhoneDirectCaller.callNumber("${vmDashBoard.helpLine.values.elementAt(index)[0]}");
              },
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  gradient:const LinearGradient(colors: [ColorCode.secondBlue,Colors.white],stops: [0,1],begin:Alignment.centerRight,end: Alignment.centerLeft),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ColorCode.border,width: 0.5,)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextMain(label: vmDashBoard.helpLine.keys.elementAt(index), fontSize: 12,),
                        const SizedBox(height: 4,),
                        TextMain(label: vmDashBoard.helpLine.values.elementAt(index)[0], fontSize: 10,color: ColorCode.textSecondary,fontWeight: FontWeight.w500,),
                    ],
                    ),
                   const SizedBox(width: 36,),
                    Image.asset(vmDashBoard.helpLine.values.elementAt(index)[1],height: 44,width: 44,)
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context,index)=>const SizedBox(width: 15,),
          itemCount: 3),
    );
  }

  Widget nearMe(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _nearMeContainer(label: 'Pharmacy',assets: 'assets/pharmacy.png'),
        _nearMeContainer(label: 'Police station',assets: 'assets/police_station.png'),
        _nearMeContainer(label: 'Bus station',assets: 'assets/bus.png'),
        _nearMeContainer(label: 'Hospitals',assets: 'assets/hospital.png'),
        _nearMeContainer(label: 'Hotels',assets: 'assets/hotels.png'),
      ],
    );
  }
// Near Me Container Ui
  Widget _nearMeContainer({ required String label, required String assets}){
    return Column(
      children: [
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: (){
            /// Launch url function of Google Map's......
            vmDashBoard.launchMapUrl(label);
          },
          child: Container(
            height: 44,
            width: 44,
            padding:const EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient:const LinearGradient(colors: [Colors.white,ColorCode.secondBlue,],stops: [0.4,1],begin:Alignment.topCenter,end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorCode.border,width: 0.5,)
            ),
            child: Image.asset(assets,height: 24,width: 24,),
          ),
        ),
        const SizedBox(height: 6,),
        TextMain(label: label, fontSize: 10,color: ColorCode.textSecondary,)
      ],
    );
  }


}