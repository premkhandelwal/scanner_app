import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/models/orientations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scanner_app/logic/bloc/image/image_bloc.dart';
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
  late ImageBloc imageBloc;
  @override
  void initState() {
    imageBloc = BlocProvider.of<ImageBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(30)),
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
                  imageBloc.add(CaptureImageRequested(
                      pictureController: _pictureController));
                  
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
