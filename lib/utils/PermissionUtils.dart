import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static Future<bool> checkPermission(Permission permission) async {
    final status = await permission.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}
