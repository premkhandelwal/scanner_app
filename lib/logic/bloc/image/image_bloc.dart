import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scanner_app/logic/bloc/camera/camera_cubit.dart';
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
      } else if (event is AddInitializeInProgress) {
        emit(InitializeInProgress(value: event.val));
      } else if (event is InitializeCamera) {
        mapCaptureImagetoState(emit);
      } else if (state is ImageInitial) {
        add(InitializeCamera());
      }
    });
  }

  void mapCaptureImagetoState(Emitter<ImageState> emit) async {
    cameraScubscription = cameraCubit.initCamera().listen((cameraState) {
      if (cameraState is InitializeCameraSuccess) {
        add(AddInitializeEvent(cameraController: cameraState.controller));
      } else if (cameraState is InitializeCameraInProgress) {
        add(AddInitializeInProgress(val: cameraState.val));
      }
    });
  }

  @override
  Future<void> close() {
    cameraScubscription!.cancel();
    return super.close();
  }
}
