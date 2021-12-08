import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/models/orientations.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scanner_app/screens/preview_card.dart';

String? lastPhotoPath;

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  final PictureController _pictureController = PictureController();

  final ValueNotifier<CameraOrientations> _orientation =
      ValueNotifier(CameraOrientations.PORTRAIT_UP);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
            color: Colors.grey,
              borderRadius: BorderRadius.circular(30)
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.photo),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(100)),
            child: IconButton(
                highlightColor: Colors.orange,
                splashColor: Colors.blue,
                onPressed: () async {
                  final Directory extDir = await getTemporaryDirectory();

                  final String filePath =
                      '${extDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                  await _pictureController.takePicture(filePath);
                  lastPhotoPath = filePath;
                  setState(() {});
                },
                icon: const Icon(Icons.camera_alt)),
          ),
          PreviewCardWidget(
            lastPhotoPath: lastPhotoPath,
            orientation: _orientation,
          ),
        ],
      ),
    );
  }
}
