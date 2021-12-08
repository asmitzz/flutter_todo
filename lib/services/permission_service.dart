import 'package:flutter_todo/widgets/toast.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  Future<bool> requestGalleryPermission() async {
    try {
      PermissionStatus status = await Permission.photos.request();
      return status.isGranted;
    } catch (e) {
      return MyToast().errorToast(e.toString());
    }
  }
}
