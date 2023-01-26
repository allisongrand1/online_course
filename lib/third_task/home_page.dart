import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'webview/mock_webview.dart'
    if (dart.library.io) 'webview/non_web_platform_webview.dart'
    if (dart.library.html) 'webview/web_platform_webview.dart';

class ShowWebsiteWithPlatform extends StatefulWidget {
  const ShowWebsiteWithPlatform({super.key});

  @override
  State<ShowWebsiteWithPlatform> createState() =>
      _ShowWebsiteWithPlatformState();
}

class _ShowWebsiteWithPlatformState extends State<ShowWebsiteWithPlatform> {
  String web = '';
  Future findWebsite(String website) async {
    if (web == '') {
      return "Введите адрес сайта";
    }
    return webView(website);
  }

  TextEditingController controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: FutureBuilder(
                future: findWebsite(web),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (web == '') {
                      return Center(child: Text(snapshot.data));
                    }
                    return Container(
                      child: snapshot.data,
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.active) {
                    return const Center(child: Text('ConnectionState.active'));
                  }
                  return const Text('data');
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        suffixIcon: Container(
                      width: 60,
                      color: Colors.black,
                      child: TextButton(
                        onPressed: () {
                          return setState(() {
                            web = controllerText.text;
                          });
                        },
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.white),
                        child: const Text('Найти'),
                      ),
                    )),
                    controller: controllerText,
                  ),
                  (kIsWeb)
                      ? const Text('Application running on Web')
                      : Text(
                          "Application running on ${Platform.operatingSystem}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
