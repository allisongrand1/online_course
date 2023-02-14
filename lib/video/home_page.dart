import 'package:flutter/material.dart';
import 'package:webview_camera_maps_playback_flutter/video/video.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: SizedBox(
                  height: 200,
                  child: VideoPlay(
                    video:
                        'https://archive.org/download/cCloud_20151126/cCloud.mp4',
                  )),
            ),
          )
        : Scaffold(
            appBar: AppBar(),
            body: const Center(
                child: VideoPlay(
              video: 'https://archive.org/download/cCloud_20151126/cCloud.mp4',
            )),
          );
  }
}
