import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';
import 'package:scanner_app/constants/globals.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState1> {
  CameraCubit() : super(CameraInitial());

  CameraDescription? _camera;
  Stream<CameraState1> initCamera() async* {
    StreamController controller = Globals.imageLoadValue;

    controller.sink.add(0.1);
    final cameras = await availableCameras();
    // yield InitializeCameraInProgress();
    await Future.delayed(const Duration(milliseconds: 500));

    controller.sink.add(0.7);
    await Future.delayed(const Duration(milliseconds: 500));
    _camera = cameras.first;
    Globals.cameraController = CameraController(_camera!, ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.yuv420, enableAudio: true);
    // yield InitializeCameraInProgress();
    controller.sink.add(0.9);
    await Globals.cameraController!.initialize();
    // yield InitializeCameraInProgress();
    controller.sink.add(1.0);
    yield InitializeCameraSuccess();
  }
}
