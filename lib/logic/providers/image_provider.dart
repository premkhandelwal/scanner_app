import 'package:camera/camera.dart';

abstract class BaseImageProvider {
  Future<void> initializeCamera();
  Future<void> captureImage();
}

class ImagesProvider extends BaseImageProvider {
   CameraDescription? _camera;
   CameraController? _cameraController;
  
  @override
  Future<void> captureImage() async{
    final cameras = await availableCameras();
    _camera = cameras.first;
    _cameraController = CameraController(_camera!, ResolutionPreset.high);
    throw UnimplementedError();
  }

  @override
  Future<void> initializeCamera() async{
    final cameras = await availableCameras();
    _camera = cameras.first;
    _cameraController = CameraController(_camera!, ResolutionPreset.high);
  }
}
