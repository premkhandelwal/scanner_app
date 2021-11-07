import 'dart:io';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  const DisplayPictureScreen({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {

  File? imageFile;

  @override
  void initState() {
    imageFile = File(widget.imagePath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Display the picture")),
      body: Crop(
        image: imageFile!.readAsBytesSync(),
        onCropped: (image) {
          imageFile = File.fromRawPath(image);
        },
      ),
    );
  }
}
