// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

Widget webView(String link) => WebPlatformWebView(
      link: link,
    );

class WebPlatformWebView extends StatelessWidget {
  final String link;

  const WebPlatformWebView({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    final id = Random().nextInt.toString();
    ui.platformViewRegistry.registerViewFactory(
        id, (int viewId) => html.IFrameElement()..src = link);

    return HtmlElementView(
      viewType: id,
    );
  }
}
