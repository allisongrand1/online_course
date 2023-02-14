import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  final String video;
  const VideoPlay({super.key, required this.video});

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  double isVisible = 0;
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.video);

    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) => setState(() {}));
    controller.play();
    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        VideoPlayer(controller),
        Align(
          alignment: Alignment.bottomCenter,
          child: VideoProgressIndicator(
            controller,
            allowScrubbing: true,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                controller.value.position.inSeconds < 60
                    ? Text(
                        "00 : ${controller.value.position.inSeconds}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      )
                    : Text(
                        "01 : ${controller.value.position.inSeconds - 60}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                Text(
                  "1 : ${controller.value.duration.inSeconds - 60}",
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: isVisible,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                  onPressed: () {
                    Duration currentPosition = controller.value.position;
                    Duration targetPosition =
                        currentPosition - const Duration(seconds: 10);
                    controller.seekTo(targetPosition);
                  },
                  icon: const Icon(
                    Icons.replay_10,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                    setState(() {
                      isVisible == 1 ? isVisible = 0 : isVisible = 1;
                    });
                  },
                  icon: controller.value.isPlaying
                      ? const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.pause,
                          color: Colors.white,
                        )),
              Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: IconButton(
                      onPressed: () {
                        Duration currentPosition = controller.value.position;
                        Duration targetPosition =
                            currentPosition + const Duration(seconds: 10);
                        controller.seekTo(targetPosition);
                      },
                      icon: const Icon(
                        Icons.replay_10,
                        color: Colors.white,
                      ))),
            ])),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
