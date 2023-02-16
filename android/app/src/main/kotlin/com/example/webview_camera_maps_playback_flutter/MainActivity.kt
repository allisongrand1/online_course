package com.example.webview_camera_maps_playback_flutter
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setLocale("en_US") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("a98d1b2f-7799-460f-b83f-3c7c8c36b521") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}
