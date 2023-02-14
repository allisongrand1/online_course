import 'package:flutter/material.dart';
import 'package:webview_camera_maps_playback_flutter/video/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: "Video",
      home: const HomePage(),
    );
  }
}
