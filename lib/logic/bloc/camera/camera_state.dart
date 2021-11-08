part of 'camera_cubit.dart';

@immutable
abstract class CameraState {}

class CameraInitial extends CameraState {
}

class InitializeCameraInProgress extends CameraState {}

class InitializeCameraSuccess extends CameraState {}

class InitializeCameraFailure extends CameraState {}
