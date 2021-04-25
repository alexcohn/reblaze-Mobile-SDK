package com.reblaze.example;

import android.app.Application;
import android.util.Log;

import com.reblaze.sdk.Interval;
import com.reblaze.sdk.SdkEventListener;

import static com.reblaze.sdk.Reblaze.reblaze;

public class App extends Application implements SdkEventListener {

    @Override
    public void onSdkEvent(Kind kind, String message) {
        Log.println(kind.getValue(), "SDK event", message);
        Log.d("SDK param", "interval=\"" + reblaze.getInterval() + "\", backendUrl=\"" + reblaze.getBackendUrl() + "\"");
    }

    @Override
    public void onCreate() {
        super.onCreate();

        Log.d("rbzsdk", reblaze.generateHash());
        reblaze.setEventListener(this);

        reblaze.setUidHeaderName("session_id");
        reblaze.setUid("123456789");
        reblaze.setInterval(Interval.MINIMUM_INTERVAL);

        Log.d("rbzsdk", reblaze.generateHash());
    }
}
