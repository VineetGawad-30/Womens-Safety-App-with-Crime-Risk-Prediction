import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> requestAllPermissions() async {
    final permissions = [
      Permission.location,
      Permission.sms,
      Permission.microphone,
      Permission.contacts,
    ];

    // Request all permissions at once
    Map<Permission, PermissionStatus> statuses = await permissions.request();

    // Check if all are granted
  bool allGranted = statuses.values.every((status) => status.isGranted);

    // If not all granted, handle denied or permanently denied
    if (!allGranted) {
      for (var entry in statuses.entries) {
        if (entry.value.isPermanentlyDenied) {
          await openAppSettings();
          break;
        }
      }
    }

    return allGranted;
  }
}

