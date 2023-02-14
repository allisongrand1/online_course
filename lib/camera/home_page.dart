import 'package:flutter/material.dart';
import 'package:webview_camera_maps_playback_flutter/camera/widget/camera.dart';
import 'package:webview_camera_maps_playback_flutter/camera/widget/gallery.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int currentTabIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Media"),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [Camera(), Gallery()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Camera"),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_library), label: "Gallery")
        ],
        onTap: (index) {
          setState(() {
            tabController!.index = index;
            currentTabIndex = index;
          });
        },
        currentIndex: currentTabIndex,
      ),
    );
  }
}
