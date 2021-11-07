import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());
  Stream<CameraState> initCameraStream() async* {
    yield InitializeCameraInProgress();
    CameraController cameraController = await initCamera();
    if (cameraController.cameraId != -1) {
      yield InitializeCameraSuccess(controller: cameraController);
    } else {
      yield InitializeCameraFailure();
    }
  }

  Future<CameraController> initCamera() async {
    CameraDescription? _camera;
    CameraController? _cameraController;
    final cameras = await availableCameras();
    _camera = cameras.first;
    _cameraController = CameraController(_camera, ResolutionPreset.high);
    await _cameraController.initialize();
    return _cameraController;
  }
}
