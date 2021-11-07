part of 'image_bloc.dart';

@immutable
abstract class ImageState extends Equatable{}

class ImageInitial extends ImageState {
  @override
  List<Object?> get props => [];
}

class InitializedCamera extends ImageState{
  final CameraController controller;
  InitializedCamera({
    required this.controller,
  });
  @override
  List<Object?> get props => [];
}
class InitializeInProgress extends ImageState{
  @override
  List<Object?> get props => [];
}

class ImageCaptureInProgress extends ImageState{
  @override
  List<Object?> get props => [];
}
class ImageCaptureSuccess extends ImageState{
  @override
  List<Object?> get props => [];
}
class ImageCaptureCancelled extends ImageState{
  @override
  List<Object?> get props => [];
}
class ImageCaptureFailure extends ImageState{
  @override
  List<Object?> get props => [];
}

class ImageEditInProgress extends ImageState{
  @override
  List<Object?> get props => [];
}
class ImageEditSuccess extends ImageState{
  @override
  List<Object?> get props => [];
}
class ImageEditCancelled extends ImageState{
  @override
  List<Object?> get props => [];
}
class ImageEditFailure extends ImageState{
  @override
  List<Object?> get props => [];
}

class ImageSaveInProgress extends ImageState{
  @override
  List<Object?> get props => [];
}
class ImageSaveSuccess extends ImageState{
  @override
  List<Object?> get props => [];
}
class ImageSaveCancelled extends ImageState{
  @override
  List<Object?> get props => [];
}
class ImageSaveFailure extends ImageState{
  @override
  List<Object?> get props => [];
}

