import 'package:bitdroid_clear/entry_point/entry_point.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  Supabase.initialize(
    url: 'https://qmljnsmunjzqnbrzpvbh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzOTczODUzOCwiZXhwIjoxOTU1MzE0NTM4fQ.7E8jUaisH2vAdQ-unw_Gd3hWoSxuzgMtZWi2_ePjFDI',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bitDroid Apps',
      home: SplashScreenView(
        navigateRoute: EntryPoint(),
        duration: 100,
        imageSize: 140,
        imageSrc: "",
        text: "",
        textType: TextType.NormalText,
        textStyle: TextStyle(
          fontSize: 30.0,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
