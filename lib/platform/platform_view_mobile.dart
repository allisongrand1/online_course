import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late final Widget view;
    if (defaultTargetPlatform == TargetPlatform.android) {
      view = AndroidView(
        viewType: "IntegrationAndroid",
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      view = UiKitView(
        viewType: "IntegrationIOS",
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else {
      view = Text('data');
    }
    return SizedBox(
      height: 50,
      width: 200,
      child: view,
    );
  }

  void _onPlatformViewCreated(int id) {
    print('object');
  }
}
