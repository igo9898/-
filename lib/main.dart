import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camerashot.dart';

void main() async {
  // 初始化相机
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    // String imagePath = 'images/logo.jpg';
    String imageUrl = 'https://1.bp.blogspot.com/-ENudW9msm88/UKel5BlSyjI/AAAAAAAAB-I/IX8X_db5yLg/s1600/IMG_4167.JPG';

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('極致智能旅遊APP'),
          centerTitle: true ,
          elevation: 2,
        ),

        body: Center(
          child: camerashot(
              camera: widget.camera
            // image: Image.file(File(imagePath)),
          ),
        ),
      ),
    );
  }
}


