part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class InitializeCamera extends ImageEvent {}

class CaptureImageRequested extends ImageEvent {
  final PictureController pictureController;
  CaptureImageRequested({
    required this.pictureController,
  });
}


class EditImageRequested extends ImageEvent {}

class CropImageRequested extends ImageEvent {}

class ImageSaveRequested extends ImageEvent {}

class FetchCapturedImages extends ImageEvent{}