import 'package:flutter_todo/widgets/toast.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  Future<bool> requestGalleryPermission() async {
    try {
      bool status = await Permission.photos.request().isGranted;
      return status;
    } catch (e) {
      return MyToast().errorToast(e.toString());
    }
  }
}
