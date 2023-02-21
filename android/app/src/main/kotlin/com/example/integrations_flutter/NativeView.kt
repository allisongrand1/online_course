package com.example.integrations_flutter

import android.content.Context
import android.view.View
import android.webkit.*
import android.widget.Button
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

internal class MyWebView(
        context: Context,
        messenger: BinaryMessenger,
        id: Int,
        creationParams: Map<String?, Any?>?
) : PlatformView {
    private val button: Button = Button(context)

    private val intentName = "Events"
    private val intentMessageId = "Call"

    override fun getView(): View {
        return button
    }

    override fun dispose() {}

    init {
        button.textSize = 13f
        button.text = "Android Native Button"
        button.setOnClickListener {
            /* val intent = Intent(intentName)
            intent.putExtra(intentMessageId, Random.nextInt(0, 550))
            context.sendBroadcast(intent) */
        }
    }
}
