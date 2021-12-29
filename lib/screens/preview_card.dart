import 'dart:io';
import 'package:camerawesome/models/orientations.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/screens/orientation_utils.dart';

class PreviewCardWidget extends StatelessWidget {
  final Image? lastPhotoPath;
  final ValueNotifier<CameraOrientations> orientation;

  const PreviewCardWidget({
    Key? key,
    required this.lastPhotoPath,
    required this.orientation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 100,child: _buildPreviewPicture());
  }

  Widget _buildPreviewPicture() {
    return lastPhotoPath != null
        ? Image(image: lastPhotoPath!.image,)
        : Container(
          width: OrientationUtils.isOnPortraitMode(orientation.value)
                  ? 84
                  : 256,
          decoration: BoxDecoration(
          color: Colors.grey,
            borderRadius: BorderRadius.circular(10)
          ),
          child: const Center(
            child: Icon(
              Icons.photo,
              color: Colors.white,
            ),
          ),
        );
  }
}
