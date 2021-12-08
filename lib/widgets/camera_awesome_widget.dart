import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/models/orientations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CameraAwesomeWidget extends StatelessWidget {
  const CameraAwesomeWidget({
    Key? key,
    required ValueNotifier<double> zoom,
    required ValueNotifier<Sensors> sensor,
    required ValueNotifier<Size> photoSize,
    required ValueNotifier<CameraFlashes> switchFlash,
    required ValueNotifier<CaptureModes> captureModes,
  }) : _zoom = zoom, _sensor = sensor, _photoSize = photoSize, _switchFlash = switchFlash, _captureModes = captureModes, super(key: key);

  final ValueNotifier<double> _zoom;
  final ValueNotifier<Sensors> _sensor;
  final ValueNotifier<Size> _photoSize;
  final ValueNotifier<CameraFlashes> _switchFlash;
  final ValueNotifier<CaptureModes> _captureModes;

  @override
  Widget build(BuildContext context) {
    return CameraAwesome(

      testMode: true,
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
      // fitted: true,
    );
  }
}
