import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

WebViewController controllerWebView = WebViewController();

Widget webView(String link) => (Platform.isAndroid || Platform.isIOS)
    ? WebViewWidget(
        controller: controllerWebView..loadRequest(Uri.parse(link)),
      )
    : HyperLink(link: link);

class HyperLink extends StatelessWidget {
  final String link;
  const HyperLink({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Text(link),
      ),
      onTap: () {
        launchUrl(Uri.parse(link));
      },
    );
  }
}
