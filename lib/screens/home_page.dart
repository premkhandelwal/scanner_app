import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/models/orientations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scanner_app/constants/globals.dart';
import 'package:scanner_app/logic/bloc/camera/camera_cubit.dart';
import 'package:scanner_app/screens/preview_card.dart';
// import 'package:scanner_app/logic/bloc/image/image_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late CameraCubit cameraCubit;
  @override
  void initState() {
    //cameraCubit = BlocProvider.of<CameraCubit>(context);
    super.initState();
  }

  double progress = 0.1;

    String? _lastPhotoPath;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<CameraFlashes> _switchFlash =
        ValueNotifier(CameraFlashes.NONE);
    ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.BACK);
    ValueNotifier<Size> _photoSize = ValueNotifier(Size(1080, 2340));
    ValueNotifier<double> _zoom = ValueNotifier(0.0);
    ValueNotifier<CaptureModes> _captureModes =
        ValueNotifier(CaptureModes.PHOTO);
    ValueNotifier<CameraOrientations> _orientation =
        ValueNotifier(CameraOrientations.PORTRAIT_UP);

    // Controller
    PictureController _pictureController = PictureController();
    return Scaffold(
      body: SafeArea(
        child: Stack(fit: StackFit.expand, children: [
          
          Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Center(
        child: CameraAwesome(
          testMode: false,
          onPermissionsResult: (bool? result) {},
          selectDefaultSize: (List<Size> availableSizes) =>
              availableSizes.first,
          onCameraStarted: () async {},
          onOrientationChanged: (CameraOrientations? newOrientation) {},
          zoom: _zoom,
          sensor: _sensor,
          photoSize: _photoSize,
          switchFlashMode: _switchFlash,
          captureMode: _captureModes,
          orientation: DeviceOrientation.portraitUp,
        ),
      ),
    ),
         PreviewCardWidget(
            lastPhotoPath: _lastPhotoPath,
            orientation: _orientation,
          ),
          IconButton(
            highlightColor: Colors.orange,
            
            alignment: Alignment.bottomCenter,
              onPressed: () async {
                final Directory extDir = await getTemporaryDirectory();

                final String filePath =
                    '${extDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                await _pictureController.takePicture(filePath);
                _lastPhotoPath = filePath;
                setState(() {});
              },
              icon: const Icon(Icons.camera_alt)),
        ]),
      ),

      /* BlocBuilder<CameraCubit, CameraState1>(
        // stream: cameraCubit.initCamera(),
        builder: (ctx, state) {
          
            if (state is InitializeCameraSuccess) {
              return CameraPreview(Globals.cameraController!);
            } else if (state is InitializeCameraInProgress ||
                state is CameraInitial) {
              return StreamBuilder<double>(
                  stream: Globals.imageLoadValue.stream,
                  builder: (context, snapshot) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: snapshot.data,
                      ),
                    );
                  });
            }
            return const Text(
              "Failed to initialize camera",
            );
          }
        
      ),
 */

    );
  }

  Positioned newMethod(
      ValueNotifier<double> _zoom,
      ValueNotifier<Sensors> _sensor,
      ValueNotifier<Size> _photoSize,
      ValueNotifier<CameraFlashes> _switchFlash,
      ValueNotifier<CaptureModes> _captureModes) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Center(
        child: CameraAwesome(
          testMode: false,
          onPermissionsResult: (bool? result) {},
          selectDefaultSize: (List<Size> availableSizes) =>
              availableSizes.first,
          onCameraStarted: () async {},
          onOrientationChanged: (CameraOrientations? newOrientation) {},
          zoom: _zoom,
          sensor: _sensor,
          photoSize: _photoSize,
          switchFlashMode: _switchFlash,
          captureMode: _captureModes,
          orientation: DeviceOrientation.portraitUp,
        ),
      ),
    );
  }
}
