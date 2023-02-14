import 'package:flutter/material.dart';
import 'package:webview_camera_maps_playback_flutter/map/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      title: "Maps",
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}
