import 'dart:typed_data';

import 'package:flutter/material.dart';

class CapturedImage {
  String? fileName;
  Image? capturedImage;
  DateTime? created;
  Uint8List? imageAsBytes;
  CapturedImage({
    this.fileName,
    this.capturedImage,
   this.created,
   this.imageAsBytes,
  });
}
