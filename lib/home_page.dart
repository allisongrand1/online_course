import 'package:flutter/material.dart';
import 'package:integration_flutter/platform/mobile_service.dart';
import 'package:integration_flutter/platform/platform_view_mobile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final service = PlatformService();

  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: PlatformWidget(),
              ),
            ),
            StreamBuilder<int>(
                stream: service.getStream(),
                builder: (context, snapshot) {
                  return Text(
                      "${snapshot.hasData ? snapshot.data : 'No data'}");
                }),
          ],
        ),
      ),
    );
  }
}
