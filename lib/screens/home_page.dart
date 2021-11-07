import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner_app/logic/bloc/image/image_bloc.dart';
import 'package:scanner_app/screens/display_picture_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraDescription _camera;
  CameraController? _cameraController;
  late ImageBloc imageBloc;
  @override
  void initState() {
    // getCameras();
    imageBloc = BlocProvider.of<ImageBloc>(context);
    imageBloc.add(CaptureImageRequested());
    super.initState();
  }

  void getCameras() async {
    final cameras = await availableCameras();
    _camera = cameras.first;
    _cameraController = CameraController(_camera, ResolutionPreset.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner App"),
        centerTitle: true,
      ),
      body: BlocBuilder<ImageBloc, ImageState>(
        builder: (ctx, state) {
          if (state is InitializedCamera) {
            _cameraController = state.controller;
            return CameraPreview(state.controller);
          }
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final image = await _cameraController!.takePicture();
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => DisplayPictureScreen(
                      imagePath: image.path,
                    )),
          );
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _cameraController!.dispose();
    super.dispose();
  }
}
