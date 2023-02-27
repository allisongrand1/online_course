package com.example.integration

import AndroidButtonViewFactory
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {
    private val androidViewId = "INTEGRATION_ANDROID"
    private val eventsChannel = "CALL_EVENTS"
    private val methodChannel = "CALL_METHOD"
    private val intentName = "EVENTS"
    private val intentMessageId = "CALL"

    private var receiver: BroadcastReceiver? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        flutterEngine.platformViewsController.registry.registerViewFactory(
                androidViewId,
                AndroidButtonViewFactory(flutterEngine.dartExecutor.binaryMessenger)
        )

        EventChannel(flutterEngine.dartExecutor, eventsChannel)
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
                )
    }

    fun createReceiver(events: EventChannel.EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                events.success(intent.getIntExtra(intentMessageId, 0))
            }
        }
    }
}
