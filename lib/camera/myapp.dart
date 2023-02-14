import 'package:flutter/material.dart';
import 'package:webview_camera_maps_playback_flutter/camera/home_page.dart';
import 'package:webview_camera_maps_playback_flutter/camera/widget/inhereted_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DataWidget(
        pictures: const [],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        ));
  }
}
