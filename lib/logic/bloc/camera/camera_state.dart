part of 'camera_cubit.dart';

@immutable
abstract class CameraState {}

class CameraInitial extends CameraState {
}

class InitializeCameraInProgress extends CameraState {
  final double val;
  InitializeCameraInProgress({
    required this.val,
  });
}

class InitializeCameraSuccess extends CameraState {
  final CameraController controller;
  InitializeCameraSuccess({
    required this.controller,
  });

}

class InitializeCameraFailure extends CameraState {}
