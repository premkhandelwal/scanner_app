import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/models/orientations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scanner_app/logic/bloc/camera/camera_cubit.dart';
import 'package:scanner_app/widgets/bottom_bar.dart';
import 'package:scanner_app/widgets/camera_awesome_widget.dart';
// import 'package:scanner_app/logic/bloc/image/image_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

String? _lastPhotoPath;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late CameraCubit cameraCubit;
  @override
  void initState() {
    //cameraCubit = BlocProvider.of<CameraCubit>(context);
    super.initState();
  }

  double progress = 0.1;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<CameraFlashes> _switchFlash =
        ValueNotifier(CameraFlashes.NONE);
    ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.FRONT);
    ValueNotifier<Size> _photoSize = ValueNotifier(const Size(1080, 2340));
    ValueNotifier<double> _zoom = ValueNotifier(0.0);
    ValueNotifier<CaptureModes> _captureModes =
        ValueNotifier(CaptureModes.PHOTO);

    // Controller
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,

        ),
        drawer: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.ac_unit),
        ),
        bottomNavigationBar: const BottomBarWidget(),
    
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CameraAwesomeWidget(
              zoom: _zoom,
              sensor: _sensor,
              photoSize: _photoSize,
              switchFlash: _switchFlash,
              captureModes: _captureModes),
        ),
    
        /* BlocBuilder<CameraCubit, CameraState1>(
          // stream: cameraCubit.initCamera(),
          builder: (ctx, state) {
            
              if (state is InitializeCameraSuccess) {
                return CameraPreview(Globals.cameraController!);
              } else if (state is InitializeCameraInProgress ||
                  state is CameraInitial) {
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
          
        ),
     */
      ),
    );
  }
}
