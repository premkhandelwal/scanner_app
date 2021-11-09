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
        print(error);
        throw Exception();
      });
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
