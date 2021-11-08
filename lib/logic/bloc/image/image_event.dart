part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class InitializeCamera extends ImageEvent {}

class CaptureImageRequested extends ImageEvent {}

class EditImageRequested extends ImageEvent {}

class CropImageRequested extends ImageEvent {}

class ImageSaveRequested extends ImageEvent {}

class AddInitializeEvent extends ImageEvent {}

class AddInitializeInProgress extends ImageEvent {}
