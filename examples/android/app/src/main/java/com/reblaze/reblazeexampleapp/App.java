package com.reblaze.reblazeexampleapp;

import android.app.Application;
import android.util.Log;

import com.reblaze.sdk.error.SDKConfigurationException;
import com.reblaze.sdk.reblaze;

public class App extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        try {
            reblaze.configure(this, "example@objc", "3209d0026eff409dadc31901acc3eb8c");
            Log.d("reblaze", reblaze.getHash(1602474085) + " expected: 6a137d85a4b593142b44156dcb9330b0");
        } catch (SDKConfigurationException e) {
            e.printStackTrace();
        }
    }
}
