import 'package:camera/camera.dart';
import 'package:scanner_app/constants/globals.dart';

abstract class BaseImageProvider {
  Future<XFile?> captureImage();
}

class ImagesProvider extends BaseImageProvider {
  @override
  Future<XFile?> captureImage() async {
    try {
      await Globals.cameraController!.takePicture().then((value) {
        return value;
      }).onError((error, stackTrace) {
        throw Exception();
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
