package com.reblaze.example;

import android.app.Application;
import android.util.Log;

import com.reblaze.sdk.Interval;
import com.reblaze.sdk.SdkEventListener;

import static com.reblaze.sdk.Reblaze.reblaze;

public class App extends Application {

    private final SdkEventListener printAll = new SdkEventListener() {
        @Override
        public void onSdkEvent(Kind kind, String message) {
            Log.println(kind.getValue(), "SDK event", message);
            Log.d("SDK param", "userAgent=\"" + reblaze.getUserAgent() + "\", backendUrl=\"" + reblaze.getBackendUrl() + "\"");
        }
    };

    @Override
    public void onCreate() {
        super.onCreate();

        Log.d("rbzsdk", reblaze.generateHash());
        reblaze.setEventListener(printAll);

        reblaze.setUidHeaderName("session_id");
        reblaze.setUid("123456789");
        reblaze.setInterval(Interval.MINIMUM_INTERVAL);
        reblaze.setUserAgent(getString(R.string.app_name));

        Log.d("rbzsdk", reblaze.generateHash());
    }
}
