import 'package:flutter_todo/services/permission_service.dart';
import 'package:flutter_todo/widgets/toast.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerServices{
  getFromGallery(Function cb) async {
    if (await PermissionsService().requestGalleryPermission()) {
      try {
        XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxWidth: 1800,
          maxHeight: 1800,
        );
        if (pickedFile != null) {
          cb(pickedFile);
        }
      } catch (e) {
        return MyToast().errorToast(e.toString());
      }
    }
  }
}