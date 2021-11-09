part of 'camera_cubit.dart';

@immutable
abstract class CameraState1 {}

class CameraInitial extends CameraState1 {
}

class InitializeCameraInProgress extends CameraState1 {}

class InitializeCameraSuccess extends CameraState1 {}

class InitializeCameraFailure extends CameraState1 {}
