/* enum CustomPlatform {
  android,
  linux,
  macos,
  windows,
  ios,
  fichsia,
  web,
  undefain
}

class AppPlatform {
  static Map<String, CustomPlatform> _platformMap = {
    'android': CustomPlatform.android,
    'linux': CustomPlatform.linux,
    'fichsia': CustomPlatform.fichsia,
    'ios': CustomPlatform.ios,
    'macos': CustomPlatform.macos,
    'windows': CustomPlatform.windows,
  };

  static CustomPlatform _getPlatform() {
    if (kIsWeb) {
      return CustomPlatform.web;
    }
    return _platformMap[Platform.operatingSystem] ?? CustomPlatform.undefain;
  }

  CustomPlatform get platform => _getPlatform();

  bool get isMobile =>
      platform == CustomPlatform.android || platform == CustomPlatform.ios;
} */



 /*  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://flutter.dev')); */

 /*  final PlatformWebViewController _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse('https://flutter.dev'),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: _controller),
      ).build(context),
    );
  }
} */