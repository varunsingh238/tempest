import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tempest/pages/camera_screen.dart';
import 'package:tempest/pages/home_page.dart';
import 'package:tempest/pages/splash_screen.dart';
import 'package:tempest/pages/welcome.dart';
import 'package:tempest/src/utils/theme.dart';

import 'firebase_options.dart';

late Size mq;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  //_initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Mytheme.lightTheme,
      darkTheme: Mytheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}

// _initializeFirebase() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }
