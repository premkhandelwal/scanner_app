import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';
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
    on<ImageEvent>((event, emit) async {
      if (event is CaptureImageRequested) {
        CapturedImage _capturedImage = await mapCaptureImagetoState();
        emit(ImageCaptureSuccess(capturedImage: _capturedImage));
        return;
      }
    });
  }

  Future<CapturedImage> mapCaptureImagetoState() async {
    XFile? image = await imageProvider.captureImage();
    if (image != null) {
      Uint8List bytes = await image.readAsBytes();
      CapturedImage _capturedImage = CapturedImage(
        fileName: image.name,
        imagePath: image.path,
        created: DateTime.now(),
        imageAsBytes: bytes,
      );
      return _capturedImage;
    }
    return CapturedImage(
        fileName: "", imagePath: "", created: DateTime.now(), imageAsBytes: Uint8List.fromList([]));
  }
}
