package com.example.my_project;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentFilter;
import android.nfc.FormatException;
import android.nfc.NdefMessage;
import android.nfc.NdefRecord;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.nfc.tech.Ndef;
import android.os.Parcelable;
import android.util.Log;
import android.widget.Toast;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

public class NfcWriter {
    private final NfcAdapter nfcAdapter;
    private final PendingIntent pendingIntent;
    private final IntentFilter[] writingTagFilter;
    private Activity activity;

    public NfcWriter(Activity context) {
        activity = context;
        nfcAdapter = NfcAdapter.getDefaultAdapter(activity);
        IntentFilter tagDetected = new IntentFilter(NfcAdapter.ACTION_TAG_DISCOVERED);
        tagDetected.addCategory(Intent.CATEGORY_DEFAULT);
        writingTagFilter = new IntentFilter[]{tagDetected};
        pendingIntent = PendingIntent.getActivity(
                activity, 0, new Intent(activity, activity.getClass()).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP), PendingIntent.FLAG_MUTABLE);
    }

    public boolean write(String url) {
        if (nfcAdapter == null) {
            return false;
        }

        NdefRecord[] records = new NdefRecord[0];
        try {
            records = new NdefRecord[]{createRecord(url)};
            NdefMessage message = new NdefMessage(records);

            Tag detectedTag = activity.getIntent().getParcelableExtra(NfcAdapter.EXTRA_TAG);
            Ndef ndef = Ndef.get(detectedTag);

            if (ndef != null) {
                ndef.connect();
                ndef.writeNdefMessage(message);
                ndef.close();
                return true;
            } else {
                return false;
            }
        } catch (IOException | FormatException e) {
            e.printStackTrace();
        }

        return false;
    }

    public void enableForegroundDispatch() {
        if (nfcAdapter != null) {
            nfcAdapter.enableForegroundDispatch(activity, pendingIntent, writingTagFilter, null);
        }
    }

    public void disableForegroundDispatch() {
        if (nfcAdapter != null) {
            nfcAdapter.disableForegroundDispatch(activity);
        }
    }

    private NdefRecord createRecord(String content) throws UnsupportedEncodingException {
        byte[] urlBytes = content.getBytes(Charset.forName("UTF-8"));
        byte[] payload = new byte[urlBytes.length + 1];
        System.arraycopy(urlBytes, 0, payload, 1, urlBytes.length);
        return new NdefRecord(NdefRecord.TNF_WELL_KNOWN, NdefRecord.RTD_URI, new byte[0], payload);
    }
}
