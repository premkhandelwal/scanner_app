import 'dart:io';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:path_provider/path_provider.dart';

abstract class BaseImageProvider {
  Future<String?> captureImage(PictureController pictureController);
}

class ImagesProvider extends BaseImageProvider {
  @override
  Future<String?> captureImage(PictureController pictureController) async {
    try {
      final Directory extDir = await getTemporaryDirectory();

      final String filePath =
          '${extDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      await pictureController.takePicture(filePath);
      return filePath;
    } catch (e) {
      throw Exception(e);
    }
  }
}
