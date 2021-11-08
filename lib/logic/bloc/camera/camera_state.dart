
part of 'camera_cubit.dart';

@immutable
abstract class CameraState extends Equatable{}

class CameraInitial extends CameraState {
  @override
  List<Object?> get props => [];
}


class InitializeCameraInProgress extends CameraState {
   @override
  List<Object?> get props => [];
}

class InitializeCameraSuccess extends CameraState {
  final CameraController controller;
  InitializeCameraSuccess({
    required this.controller,
  });
  

  @override
  List<Object?> get props => [controller];
  }


class InitializeCameraFailure extends CameraState {
   @override
  List<Object?> get props => [];
}