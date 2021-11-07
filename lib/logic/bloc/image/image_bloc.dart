import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scanner_app/logic/bloc/camera1/cubit/camera_cubit.dart';
import 'package:scanner_app/logic/providers/image_provider.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImagesProvider imageProvider;
  StreamSubscription? cameraScubscription;
  CameraCubit cameraCubit;
  ImageBloc({
    required this.imageProvider,
    this.cameraScubscription,
    required this.cameraCubit,
  }) : super(ImageInitial()) {
    on<ImageEvent>((event, emit) {
      if (event is AddInitializeEvent) {
        emit(InitializedCamera(controller: event.cameraController));
      }
      if (event is CaptureImageRequested) {
        Stream x = cameraCubit.initCameraStream();
        cameraScubscription = x.listen((state) {
          if (state is InitializeCameraSuccess) {
            if (emit.isDone) {
              add(AddInitializeEvent(cameraController: state.controller));
            } else {
              emit(InitializedCamera(controller: state.controller));
            }
            // emit(ImageCaptureSuccess());
          } else if (state is InitializeInProgress) {
            emit(InitializeInProgress());
          }
        });
      }
    });
  }
  @override
  Future<void> close() {
    cameraScubscription!.cancel();
    return super.close();
  }
}
