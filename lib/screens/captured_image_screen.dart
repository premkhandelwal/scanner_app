import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner_app/logic/bloc/image/image_bloc.dart';

class CapturedImagesScreen extends StatefulWidget {
  const CapturedImagesScreen({Key? key}) : super(key: key);

  @override
  _CapturedImagesScreenState createState() => _CapturedImagesScreenState();
}

class _CapturedImagesScreenState extends State<CapturedImagesScreen> {
  late ImageBloc imageBloc;
  @override
  void initState() {
    super.initState();
    imageBloc = BlocProvider.of<ImageBloc>(context);
    imageBloc.add(FetchCapturedImages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state is FetchedCapturedImages) {
            return ListView.builder(
              itemCount: state.imagesList.length,
              itemBuilder: (BuildContext context, int index) {
                return state.imagesList[index].imageAsBytes != null
                    ? Image.memory(state.imagesList[index].imageAsBytes!)
                    : Container();
              },
            );
          }
          return const Text("Loading Images...Please wait");
        },
      ),
    );
  }
}
