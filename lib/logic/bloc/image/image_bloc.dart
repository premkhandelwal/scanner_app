import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:scanner_app/logic/bloc/camera/camera_cubit.dart';
import 'package:scanner_app/logic/models/image.dart';
import 'package:scanner_app/logic/providers/image_provider.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImagesProvider imageProvider;
  CameraCubit cameraCubit;
  List<CapturedImage> imageList = [];
  ImageBloc({
    required this.imageProvider,
    required this.cameraCubit,
  }) : super(ImageInitial()) {
    on<ImageEvent>((event, emit) async {
      if (event is CaptureImageRequested) {
        CapturedImage _capturedImage =
            await mapCaptureImagetoState(event.pictureController);
        emit(ImageCaptureSuccess(capturedImage: _capturedImage));
        return;
      } else if (event is FetchCapturedImages) {
        emit(FetchedCapturedImages(imagesList: imageList));
        return;
      }
    });
  }

  Future<CapturedImage> mapCaptureImagetoState(
      PictureController pictureController) async {
    String? imagePath = await imageProvider.captureImage(pictureController);
    if (imagePath != null) {
      File fileImage = File(imagePath);
      Image image = Image.file(fileImage);
      Uint8List bytes = await fileImage.readAsBytes();
      CapturedImage _capturedImage = CapturedImage(
        fileName: DateTime.now().toIso8601String(),
        capturedImage: image,
        created: DateTime.now(),
        imageAsBytes: bytes,
      );
      imageList.add(_capturedImage);
      return _capturedImage;
    }
    return CapturedImage();
  }
}
