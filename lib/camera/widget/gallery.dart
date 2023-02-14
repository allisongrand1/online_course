import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_camera_maps_playback_flutter/camera/widget/inhereted_widget.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
            itemCount: DataWidget.of(context).length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.file(
                  File(DataWidget.of(context)[index].path),
                  fit: BoxFit.cover,
                ),
              );
            }));
  }
}
