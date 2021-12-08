import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:scanner_app/logic/bloc/camera/camera_cubit.dart';
import 'package:scanner_app/logic/models/image.dart';
import 'package:scanner_app/logic/providers/image_provider.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImagesProvider imageProvider;
  CameraCubit cameraCubit;
  List<Image> imageList = [];
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
      }
    });
  }

  Future<CapturedImage> mapCaptureImagetoState(
      PictureController pictureController) async {
    String? imagePath = await imageProvider.captureImage(pictureController);
    if (imagePath != null) {
      File fileImage = File(imagePath);
      Image image = Image.file(fileImage);
      imageList.add(image);
      Uint8List bytes = await fileImage.readAsBytes();
      CapturedImage _capturedImage = CapturedImage(
        fileName: DateTime.now().toIso8601String(),
        imagePath: imagePath,
        created: DateTime.now(),
        imageAsBytes: bytes,
      );
      return _capturedImage;
    }
    return CapturedImage(
        fileName: "",
        imagePath: "",
        created: DateTime.now(),
        imageAsBytes: Uint8List.fromList([]));
  }
}
