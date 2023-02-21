package com.example.integrations_flutter

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import java.util.*

class MainActivity : FlutterActivity() {
    private val CHANNEL = "ChannelText"
    private var receiver: BroadcastReceiver? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.platformViewsController.registry.registerViewFactory(
                "IntegrationAndroid",
                AndroidButtonViewFactory(flutterEngine.dartExecutor.binaryMessenger)
        )
    }

    fun createReceiver(events: EventChannel.EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                events.success(intent.getIntExtra("Call", 0))
            }
        }
    }
}

/*  MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
        call,
        result ->
    if (call.method == "Call") {
        result.success(Random.nextInt(0, 550))
    } else {
        result.notImplemented()
    }
} */

        /*   EventChannel(flutterEngine.dartExecutor, "Call_event")
        .setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onListen(args: Any?, events: EventChannel.EventSink) {
                        receiver = createReceiver(events)
                        applicationContext?.registerReceiver(
                                receiver,
                                IntentFilter(intentName)
                        )
                    }

                    override fun onCancel(args: Any?) {
                        receiver = null
                    }
                }
        ) */
