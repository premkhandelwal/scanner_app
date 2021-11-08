part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class CaptureImageRequested extends ImageEvent {}

class EditImageRequested extends ImageEvent {}

class CropImageRequested extends ImageEvent {}

class ImageSaveRequested extends ImageEvent {}

class AddInitializeEvent extends ImageEvent {
  final CameraController cameraController;
  AddInitializeEvent({
    required this.cameraController,
  });
}

class AddInitializeInProgress extends ImageEvent{}
