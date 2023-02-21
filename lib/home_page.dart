import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integrations_flutter/platform/platform_view_mobile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const textChannel = MethodChannel('ChannelText');

  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: PlatformWidget())
            /* Text(
              text,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () async {
                  text = await callSimpleMethodChannel();
                  setState(() {});
                },
                child: Text('Получить текст')) */
          ],
        ),
      ),
    );
  }

  Future callSimpleMethodChannel() async =>
      await textChannel.invokeMethod('getText');
}
