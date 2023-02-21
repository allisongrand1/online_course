import 'package:flutter/services.dart';

class PlatformService {
  static const platform = MethodChannel("ChannelText");
  static const stream = EventChannel("Call_event");

  @override
  Future<int> getValue() async {
    try {
      return await platform.invokeMethod("Call");
    } on PlatformException catch (e) {
      return 0;
    }
  }

  @override
  Stream<int> getStream() =>
      stream.receiveBroadcastStream().map((event) => event as int);
}
