import 'dart:async';

import 'package:camera/camera.dart';

class Globals {
  static CameraController? cameraController;
  static StreamController<double> imageLoadValue = StreamController.broadcast();
}
