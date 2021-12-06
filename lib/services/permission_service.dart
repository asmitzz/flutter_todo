import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
   requestGalleryPermission() async {
    try {
      var status = await Permission.photos.request().isGranted;
      if (status) {
        print("permission granted");
      }
      return status;
    } catch (e) {
      print(e.toString());
    }
  }
}
