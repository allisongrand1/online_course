import 'package:flutter/services.dart';

class PlatformService {
  static const platform = MethodChannel("CALL_METHOD");
  static const stream = EventChannel("CALL_EVENTS");

  Future<int> getValue() async {
    try {
      return await platform.invokeMethod("CALL");
    } on PlatformException {
      return 0;
    }
  }

  Stream<int> getStream() =>
      stream.receiveBroadcastStream().map((event) => event as int);
}
