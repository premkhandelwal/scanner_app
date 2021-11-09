import 'dart:typed_data';

class CapturedImage {
  String fileName;
  String imagePath;
  DateTime created;
  Uint8List imageAsBytes;
  CapturedImage({
    required this.fileName,
    required this.imagePath,
    required this.created,
    required this.imageAsBytes,
  });
}
