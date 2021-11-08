import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';


part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());
  
  Stream<CameraState> initCamera() async* {
    CameraDescription? _camera;
    CameraController? _cameraController;
    yield InitializeCameraInProgress(val: 0.3);
    final cameras = await availableCameras();
    yield InitializeCameraInProgress(val: 0.5);
    _camera = cameras.first;
    _cameraController = CameraController(_camera, ResolutionPreset.high,imageFormatGroup: ImageFormatGroup.yuv420,enableAudio: true);
    yield InitializeCameraInProgress(val: 0.7);
    await _cameraController.initialize();
    yield InitializeCameraInProgress(val:  1);
    yield InitializeCameraSuccess(controller: _cameraController);
  }
}
