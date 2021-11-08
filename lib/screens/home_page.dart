import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner_app/constants/globals.dart';
import 'package:scanner_app/logic/bloc/camera/camera_cubit.dart';
// import 'package:scanner_app/logic/bloc/image/image_bloc.dart';
import 'package:scanner_app/screens/display_picture_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraCubit cameraCubit;
  @override
  void initState() {
    // getCameras();
    cameraCubit = BlocProvider.of<CameraCubit>(context);
    // cameraCubit.initCamera();
    // cameraCubit.add(CaptureImageRequested());
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
      body: StreamBuilder<CameraState>(
        stream: cameraCubit.initCamera(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.waiting) {
            return StreamBuilder<double>(
                  stream: Globals.imageLoadValue.stream,
                  builder: (context, snapshot) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: snapshot.data,
                      ),
                    );
                  });
          } else {
            if (snapshot.data is InitializeCameraSuccess) {
              return CameraPreview(Globals.cameraController!);
            } else if (snapshot.data is InitializeCameraInProgress ||
                snapshot.data is CameraInitial) {
              return StreamBuilder<double>(
                  stream: Globals.imageLoadValue.stream,
                  builder: (context, snapshot) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: snapshot.data,
                      ),
                    );
                  });
            }
            return const Text(
              "Failed to initialize camera",
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // imageBloc.add(CaptureImageRequested());
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
