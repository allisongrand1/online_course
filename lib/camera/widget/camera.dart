import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:webview_camera_maps_playback_flutter/camera/widget/inhereted_widget.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> with WidgetsBindingObserver {
  late List<CameraDescription> cameras;
  CameraController? controller;
  late XFile lastPicture;

  @override
  void initState() {
    super.initState();
    unawaited(initCamera());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    //App state changed before we got the chance to initialize
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      //если камера не активна можно ее диспоуз
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      //при смене состояния цикла будем пересоздавать контроллер снова, чтобы не возникало ошибок
      _onNewCameraSelected(cameraController.description);
    }
  }

  Future<void> initCamera() async {
    cameras = await availableCameras(); //инициализация камер

    controller = CameraController(
        cameras[0],
        ResolutionPreset
            .max); // предустановка для контроллера: какая камера, какое разрешение

    await controller!.initialize();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        controller?.value.isInitialized == true
            ? Center(
                child: CameraPreview(controller!),
              )
            : const SizedBox(),
        Align(
          alignment: Alignment.bottomCenter,
          child: IconButton(
            icon: const Icon(Icons.camera),
            iconSize: 48,
            onPressed: () async {
              lastPicture = await controller!.takePicture();
              // ignore: use_build_context_synchronously
              DataWidget.of(context).add(lastPicture);
              setState(() {});
            },
          ),
        )
      ],
    );
  }

  void _onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose(); //убираем контроллер если не ноль
    }

    final CameraController cameraController = CameraController(
        //создаем новый контроллер
        cameraDescription,
        kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
        enableAudio: true,
        imageFormatGroup: ImageFormatGroup.jpeg);

    controller = cameraController; //присваиваем новый контроллер

    cameraController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
