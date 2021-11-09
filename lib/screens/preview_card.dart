import 'dart:io';
import 'dart:math';

import 'package:camerawesome/models/orientations.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/screens/orientation_utils.dart';

class PreviewCardWidget extends StatelessWidget {
  final String? lastPhotoPath;
  final ValueNotifier<CameraOrientations> orientation;

  const PreviewCardWidget({
    Key? key,
    required this.lastPhotoPath,
    required this.orientation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 65.0),
        child: Container(
          // position: previewAnimation,
          child: _buildPreviewPicture(),
        ),
      ),
    );
  }

  Widget _buildPreviewPicture() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(2, 2),
            blurRadius: 25,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13.0),
          child: lastPhotoPath != null
              ? Image.file(
                File(lastPhotoPath!),
                width: OrientationUtils.isOnPortraitMode(orientation.value)
                    ? 128
                    : 256,
              )
              : Container(
                  width: OrientationUtils.isOnPortraitMode(orientation.value)
                      ? 128
                      : 256,
                  height: 228,
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.photo,
                      color: Colors.white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
