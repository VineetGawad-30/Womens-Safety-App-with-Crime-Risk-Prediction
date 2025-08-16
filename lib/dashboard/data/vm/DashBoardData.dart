import 'package:safetyapp/auth/LocationService.dart';
import 'package:telephony/telephony.dart';

class DashBoardData{
  /// List To Store the selected number by users.......
 static  List <String> selectedNumber = ['9022138554','7666061445','8483087594','9545395380'];

 /// Fetch the Location Link of the User
 static Future<String> getCurrentLocationLink() async {
   try {
     final position = await LocationService.getCurrentLocation();
     return 'https://www.google.com/maps/search/?api=1&query=${position?.latitude},${position?.longitude}';
   } catch (e) {
     print("Error fetching location: $e");
     return 'Could not get location';
   }
 }
 /// This Function is Used To Send SOS Message
 static void sendMessage(String phoneNumber, String message) async {
   try {
     await Telephony.instance.sendSms(
       to: phoneNumber,// Phone Number To send sms
       message: message,// Sos Message
       ///Listener is added  to Perform Task on sucess and error
       statusListener: (SendStatus status) {
         if (status == SendStatus.DELIVERED) {
           print("SMS delivered to $phoneNumber");
         }
       },
     );
   } catch (e) {
     print("Failed to send SMS: $e");
   }
 }
}