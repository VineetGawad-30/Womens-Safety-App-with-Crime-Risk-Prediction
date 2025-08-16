import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safetyapp/dashboard/data/vm/DashBoardData.dart';
import 'package:safetyapp/dashboard/data/vm/VmDashBoard.dart';
import 'package:safetyapp/golbalui/text/TextMain.dart';
import 'package:safetyapp/utils/color/ColorCode.dart';

class SosButton extends StatefulWidget {
  final VmDashBoard vmDashBoard;
  const SosButton({super.key,required this.vmDashBoard});

  @override
  State<SosButton> createState() => _SosButtonState();
}

class _SosButtonState extends State<SosButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: (){
          HapticFeedback.mediumImpact();
          widget.vmDashBoard.isActivated.value= ! widget.vmDashBoard.isActivated.value;
          _onTapSosTask();
        },
        child: ValueListenableBuilder(valueListenable: widget.vmDashBoard.isActivated, builder: (_,val,__){
          return Container(
            width: 210,
            padding:  EdgeInsets.only(top: 10,right: widget.vmDashBoard.isActivated.value?10:21,bottom: 10,left:widget.vmDashBoard.isActivated.value? 21:10),
            decoration: BoxDecoration(
              color: ColorCode.sosButton,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (widget.vmDashBoard.isActivated.value)? const TextMain(label: 'Activate', fontSize: 20,fontWeight:FontWeight.w500,color: ColorCode.background,):sosContainer(),
                const Spacer(),
                (widget.vmDashBoard.isActivated.value)?sosContainer(): const TextMain(label: 'Deactivate', fontSize: 20,fontWeight:FontWeight.w500,color: ColorCode.background,),
              ],
            ),
          );
        })
      ),
    );
  }

 Widget sosContainer(){
    return Container(
      padding:const  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorCode.primary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: const TextMain(label: 'SOS', fontSize: 20,color: ColorCode.background,fontWeight: FontWeight.bold,),
    );
 }
 _onTapSosTask() async{
    if(widget.vmDashBoard.isActivated.value){
      String locationLink = await DashBoardData.getCurrentLocationLink();
      for(String number in DashBoardData.selectedNumber){
        DashBoardData.sendMessage(number, 'SOS! My location is: $locationLink');
      }
    }
 }
}
