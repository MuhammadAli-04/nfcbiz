package com.nfcbiz.businesscard

import android.content.Intent
import android.nfc.NfcAdapter
import android.nfc.Tag
import androidx.annotation.NonNull
import com.example.my_project.NfcWriter
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    companion object {
        private const val CHANNEL = "com.mycompany.infyvcard/nfcWriter"
    }

    var url: String? = null
    var mResult: MethodChannel.Result? = null
    lateinit var nfcWriter: NfcWriter

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        nfcWriter = NfcWriter(this)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "write") {
                url = call.arguments as String
                mResult = result
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)

        val detectedTag: Tag? = intent.getParcelableExtra(NfcAdapter.EXTRA_TAG)
        if (url != null && mResult != null) {
            if (NfcAdapter.ACTION_TAG_DISCOVERED.equals(intent.action)) {
                val success = nfcWriter.write(url!!)
                mResult!!.success(success)
            }
        }
    }

    override fun onResume() {
        super.onResume()
        nfcWriter.enableForegroundDispatch()
    }

    override fun onPause() {
        super.onPause()
        nfcWriter.disableForegroundDispatch()
    }
}
