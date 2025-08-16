
import 'package:flutter/material.dart';
import 'package:safetyapp/dashboard/data/vm/DashBoardData.dart';
import 'package:shake/shake.dart';

class VmSettings {
  static ValueNotifier<bool> isShakeDetection = ValueNotifier(false);
  static ShakeDetector? detector;


  static void toggleShakeDetection(bool isEnabled) {
    if (isEnabled) {
      detector = ShakeDetector.autoStart(
        shakeThresholdGravity: 2.7,
        onPhoneShake: (ShakeEvent event) async {
          String locationLink = await DashBoardData.getCurrentLocationLink();
          for(String number in DashBoardData.selectedNumber){
            DashBoardData.sendMessage(number, 'By Shake Detection emergency Rate can be high, SOS! My location is: $locationLink');
          }
        },
      );
    } else {
      detector?.stopListening();
      detector = null;
    }
  }
}

