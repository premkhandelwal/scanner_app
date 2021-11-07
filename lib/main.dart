import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner_app/logic/bloc/camera1/cubit/camera_cubit.dart';
import 'package:scanner_app/logic/bloc/image/image_bloc.dart';
import 'package:scanner_app/logic/providers/image_provider.dart';
import 'package:scanner_app/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    imageProvider: ImagesProvider(),
    cameraCubit: CameraCubit(),
  ));
}

class MyApp extends StatelessWidget {
  final ImagesProvider imageProvider;
  final CameraCubit cameraCubit;
  const MyApp({
    Key? key,
    required this.imageProvider,
    required this.cameraCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageBloc>(
          create: (context) =>
              ImageBloc(imageProvider: imageProvider, cameraCubit: cameraCubit),
        ),
        BlocProvider(
          create: (context) => cameraCubit,
          child: Container(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
