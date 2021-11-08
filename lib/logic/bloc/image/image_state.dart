part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class InitializedCamera extends ImageState {}

class InitializeInProgress extends ImageState {}

class ImageCaptureInProgress extends ImageState {}

class ImageCaptureSuccess extends ImageState {}

class ImageCaptureCancelled extends ImageState {}

class ImageCaptureFailure extends ImageState {}

class ImageEditInProgress extends ImageState {}

class ImageEditSuccess extends ImageState {}

class ImageEditCancelled extends ImageState {}

class ImageEditFailure extends ImageState {}

class ImageSaveInProgress extends ImageState {}

class ImageSaveSuccess extends ImageState {}

class ImageSaveCancelled extends ImageState {}

class ImageSaveFailure extends ImageState {}

