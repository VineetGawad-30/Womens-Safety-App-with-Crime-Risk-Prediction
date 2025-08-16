import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:safetyapp/auth/LocationService.dart';
import 'package:telephony/telephony.dart';
import 'package:url_launcher/url_launcher.dart';

class VmDashBoard{

  /// This Boolean Notifier is used to Manage the Sos Button state and Functionality...
  ValueNotifier<bool> isActivated = ValueNotifier(false);
  /// This Map is used to fetch the image and number of HelpLine Section..
  Map<String,dynamic> helpLine = {
    'Police':['1-0-0','assets/police.png'],// Police helpLine
    'Safe Call':['1-0-9-1','assets/safecall.png'],// Women Safety help line
    'Ambulance':['1-0-2','assets/ambulance.png'],//Ambulance helpLine
  };
  /// This Map is used To get Title as well as Image For Quick Action Section..
  Map<String,String> quickActionMap = {
    'Record audio':'assets/record.png', // record Audio title and image
    'Fake call':'assets/fake_call.png',// Fake call title and image
  };
/// This Function is Used to Launch the google Map withe Near me Query ..
  launchMapUrl(String label){
    switch(label){
      case'Pharmacy':
        // Launch the Google map With query "pharmacy near me"
        launchUrl(Uri.parse('https://www.google.com/maps/search/pharmacy+near+me/'));
        break;
      case'Police station':
      // Launch the Google map With query "Police station near+me"
        launchUrl(Uri.parse('https://www.google.com/maps/search/Police+station+near+me/'));
        break;
      case'Bus station':
      // Launch the Google map With query "bus depot near me"
        launchUrl(Uri.parse('https://www.google.com/maps/search/bus+depot+near+me/'));
        break;
      case'Hospitals':
      // Launch the Google map With query "Hospitals near me"
        launchUrl(Uri.parse('https://www.google.com/maps/search/Hospitals+near+me/'));
        break;
      case'Hotels':
      // Launch the Google map With query "Hotels near me"
        launchUrl(Uri.parse('https://www.google.com/maps/search/Hotels+near+me/'));
        break;

    }
  }



}