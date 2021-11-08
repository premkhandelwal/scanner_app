import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner_app/constants/globals.dart';
import 'package:scanner_app/logic/bloc/image/image_bloc.dart';
import 'package:scanner_app/screens/display_picture_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ImageBloc imageBloc;
  @override
  void initState() {
    // getCameras();
    imageBloc = BlocProvider.of<ImageBloc>(context);
    imageBloc.add(CaptureImageRequested());
    super.initState();
  }

  double progress = 0.0;

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
            return CameraPreview(Globals.cameraController!);
          } else if (state is InitializeInProgress || state is ImageInitial) {
            return StreamBuilder<double>(
              stream: Globals.imageLoadValue.stream,
              builder: (context, snapshot) {
                return Center(
                  child: CircularProgressIndicator(
                    value: snapshot.data,
                  ),
                );
              }
            );
          }
          return  Container(color: Colors.blue,);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /* final image = await _cameraController!.takePicture();
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => DisplayPictureScreen(
                      imagePath: image.path,
                    )),
          ); */
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  @override
  void dispose() {
    Globals.cameraController!.dispose();
    super.dispose();
  }
}
