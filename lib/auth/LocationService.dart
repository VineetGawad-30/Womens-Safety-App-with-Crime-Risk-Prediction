import 'package:geolocator/geolocator.dart';
import 'package:safetyapp/auth/PermissionService.dart';

class LocationService {
  static Future<Position?> getCurrentLocation() async {
    try {
      // 1. Check if location services (like GPS) are turned on
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings(); // Open settings for user
      }

      // 2. Check for location permission status
      LocationPermission permission = await Geolocator.checkPermission();

      // 3. If denied, ask for permission
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        // If still denied, request all permissions and stop
        if (permission == LocationPermission.denied) {
          await PermissionService.requestAllPermissions();
        }
      }

      // 4. If permission is permanently denied
      if (permission == LocationPermission.deniedForever) {
        await PermissionService.requestAllPermissions(); // Will open app settings
      }

      // 5. All good — get current position
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print('Error getting location: $e');
      return null; // Handle unexpected errors gracefully
    }
  }
}

