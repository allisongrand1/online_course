import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_camera_maps_playback_flutter/webview/widget.dart/buttons.dart';
import 'package:webview_camera_maps_playback_flutter/webview/widget.dart/textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController? _webViewController;
  String website = "https://inappwebview.dev/";
  final TextEditingController _controller = TextEditingController();
  ChromeSafariBrowser chromeSafariBrowser = ChromeSafariBrowser();
  PullToRefreshController? pullToRefreshController;
  double progress = 0;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true, // прослушивать события
        mediaPlaybackRequiresUserGesture:
            false, // true - предотвращает автоматическое воспроизведение аудио или видео
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition:
            true, // Гибридная композиция относится к способности создавать собственные представления вместе с виджетами Flutter.
        //Например, отображение собственного Webview внутри приложения Flutter.
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 60,
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Buttons(
                  webViewController: _webViewController,
                ),
                TextFieldItem(
                  controller: _controller,
                  webViewController: _webViewController,
                  website: website,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: InAppWebView(
                onLoadStop: (controller, url) async {
                  //событие запускается, когда WebView завершает загрузку URL-адреса;
                  pullToRefreshController?.endRefreshing();
                  setState(() {
                    website = url.toString();
                    _controller.text = website;
                  });
                },
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    pullToRefreshController?.endRefreshing();
                  }
                  setState(() {
                    this.progress = progress / 100;
                    _controller.text = website;
                  });
                },
                onUpdateVisitedHistory: (controller, url, androidIsReload) {
                  setState(() {
                    website = url.toString();
                    _controller.text = website;
                  });
                },
                onLoadStart: (controller, url) {
                  // событие запускается, когда WebView начинает загружать URL-адрес;
                  setState(() {
                    website = url.toString();
                    _controller.text = website;
                  });
                },
                onWebViewCreated: (controller) =>
                    _webViewController = controller,
                initialOptions: options,
                initialUrlRequest: URLRequest(url: Uri.parse(website))),
          ),
        ],
      ),
    );
  }
}
