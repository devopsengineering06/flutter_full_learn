import 'package:image_picker/image_picker.dart';

class ImageUploadManager {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> fetchFromLibrary() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // Capture a photo
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    // // Pick a video
    // final XFile? image = await picker.pickVideo(source: ImageSource.gallery);
    // // Capture a video
    // final XFile? video = await picker.pickVideo(source: ImageSource.camera);
    // // Pick multiple images
    // final List<XFile> images = await picker.pickMultiImage();
    return image;
  }

  Future<XFile?> fetchFromCamera() async {
    // Capture a photo
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    // // Pick a video
    // final XFile? image = await picker.pickVideo(source: ImageSource.gallery);
    // // Capture a video
    // final XFile? video = await picker.pickVideo(source: ImageSource.camera);
    // // Pick multiple images
    // final List<XFile> images = await picker.pickMultiImage();
    return photo;
  }
}
