import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';
import 'package:scanner_app/constants/globals.dart';
import 'package:scanner_app/logic/bloc/camera/camera_cubit.dart';
import 'package:scanner_app/logic/models/image.dart';
import 'package:scanner_app/logic/providers/image_provider.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImagesProvider imageProvider;
  CameraCubit cameraCubit;
  ImageBloc({
    required this.imageProvider,
    required this.cameraCubit,
  }) : super(ImageInitial()) {
    on<ImageEvent>((event, emit) {
      if (event is CaptureImageRequested) {
        mapCaptureImagetoState(emit);
      } 
    });
  }

  void mapCaptureImagetoState(Emitter<ImageState> emit) async {
    final image = await Globals.cameraController!.takePicture();
    CapturedImage _capturedImage = CapturedImage(
        fileName: image.name, imagePath: image.path, created: DateTime.now());
    emit(ImageCaptureSuccess(capturedImage: _capturedImage));
  }
}
