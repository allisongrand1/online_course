import 'package:flutter/cupertino.dart';
import 'package:webview_camera_maps_playback_flutter/map/myapp.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const MyApp());
}
