import android.content.Context
import android.content.Intent
import android.view.View
import android.webkit.*
import android.widget.Button
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

internal class AndroidButtonView(
        context: Context,
        id: Int,
        creationParams: Map<String?, Any?>?,
        messenger: BinaryMessenger
) : PlatformView {
    private val button: Button = Button(context)

    private val intentName = "EVENTS"
    private val intentMessageId = "CALL"

    override fun getView(): View {
        return button
    }

    override fun dispose() {}

    init {
        button.textSize = 12f
        button.text = "Android Native Button"
        button.setOnClickListener {
            val intent = Intent(intentName)
            intent.putExtra(intentMessageId, 123456)
            context.sendBroadcast(intent)
        }
    }
}
