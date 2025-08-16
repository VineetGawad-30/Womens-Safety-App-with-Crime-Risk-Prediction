import 'package:flutter/material.dart';
import 'package:safetyapp/dashboard/data/vm/VmDashBoard.dart';
import 'package:safetyapp/golbalui/text/TextMain.dart';
import 'package:safetyapp/utils/color/ColorCode.dart';

class QuickAction extends StatefulWidget {
  final VmDashBoard vmDashBoard;
  const QuickAction({super.key,required this.vmDashBoard});

  @override
  State<QuickAction> createState() => _QuickActionState();
}

class _QuickActionState extends State<QuickAction> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.separated(
        padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return InkWell(
          onTap: (){

          },
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 19),
           decoration: BoxDecoration(
               gradient:const LinearGradient(colors: [ColorCode.secondBlue,Colors.white],stops: [0,1],begin:Alignment.centerRight,end: Alignment.centerLeft),
               borderRadius: BorderRadius.circular(8),
               border: Border.all(color: ColorCode.border,width: 0.5,)
           ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextMain(label: widget.vmDashBoard.quickActionMap.keys.elementAt(index), fontSize: 10,),
                const SizedBox(width: 10,),
                Image.asset('assets/arrow_black.png',height: 14,width: 14,),
                const SizedBox(width: 10,),
                Image.asset(widget.vmDashBoard.quickActionMap.values.elementAt(index),height: 24,width: 24,),
              ],
            ),
          ),
        );
      },
          separatorBuilder: (context,index)=>const SizedBox(width: 20,),
          itemCount: widget.vmDashBoard.quickActionMap.length
      ),
    );
  }
}
