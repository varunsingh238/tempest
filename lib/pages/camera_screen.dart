// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tempest/customUi/camer_page.dart';
import 'package:tempest/pages/video.dart';

import 'camera_view.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

late List<CameraDescription> cameras;

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cam;
  Future<void>? camval;
  bool isRecording = false;
  bool flash = false;
  bool iscameraFront = true;
  double transform = pi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cam = CameraController(cameras[0], ResolutionPreset.max);
    camval = _cam.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cam.dispose();
  }

  void takePhoto(BuildContext context) async {
    if (!_cam.value.isInitialized) {
      return;
    }
    if (_cam.value.isTakingPicture) {
      return;
    }
    try {
      XFile file = await _cam.takePicture();

      Navigator.push(context, CupertinoPageRoute(builder: (context) {
        return CameraView(
          file: file,
        );
      }));
    } on CameraException catch (e) {
      debugPrint("error");
      return null;
    }
  }

  void startRecording(BuildContext context) async {
    if (!_cam.value.isInitialized) {
      return null;
    }

    try {
      await _cam.startVideoRecording();

      setState(() {
        isRecording = true;
      });
    } on CameraException catch (e) {
      debugPrint("error");
      return;
    }
  }

  void endRecording(BuildContext context) async {
    XFile videopath = await _cam.stopVideoRecording();
    setState(() {
      isRecording = false;
    });
    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return Video(file: videopath.path);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              child: CameraPreview(_cam),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });

                            flash
                                ? _cam.setFlashMode(FlashMode.torch)
                                : _cam.setFlashMode(FlashMode.off);
                          },
                          icon: Icon(
                            flash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        GestureDetector(
                          onLongPress: () {
                            startRecording(context);
                          },
                          onLongPressUp: () {
                            endRecording(context);
                          },
                          onTap: () {
                            takePhoto(context);
                          },
                          child: isRecording
                              ? const Icon(
                                  Icons.radio_button_on,
                                  color: Colors.red,
                                  size: 80,
                                )
                              : const Icon(
                                  Icons.panorama_fish_eye,
                                  color: Colors.white,
                                  size: 70,
                                ),
                        ),
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              iscameraFront = !iscameraFront;
                              transform = transform + pi;
                            });
                            int camerapos = iscameraFront ? 0 : 1;
                            _cam = CameraController(
                                cameras[camerapos], ResolutionPreset.max);

                            camval = _cam.initialize();
                          },
                          icon: Transform.rotate(
                            angle: transform,
                            child: const Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "Hold for video, tap for photo",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
